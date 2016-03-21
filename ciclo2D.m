% Script calcolo matrice di rigidezza in 2D

% num nodi per elemento
nnod = 4;

% coordinate dei nodi in rif globale

if nnod == 4
	xi = [0, 10, 10, 0]';
	yi = [0, 0, 10, 10]';
else
	xi = [0, 10, 10, 0, 5, 10, 5, 0]';
	yi = [0, 0, 10, 10, 0, 5, 10, 5]';
end

% thickness
t = 1.

% # gdl per nodo
gdl = 2;


% num punti di integrazione per ogni dimensione
npr = 2;
nps = 2;

% recupero Gauss points e pesi
[r, wr] = lgwt(npr,-1,1);
[s, ws] = lgwt(nps,-1,1);


% inizializzazione matrice di rigidezza
K = zeros(nnod*gdl);

% matrice rigidezza stato di sforzo piano

E = 72e3;
nu = 0.28;

C = [1. nu 0.; nu 1. 0.; 0. 0. (1. - nu) / 2.] * (E / (1 - nu^2));

% inizializzazione matrice complessiva punti di Gauss e pesi
pi = [];
wi = [];

% ciclo costruzione matrici punti e pesi
for i=1:npr
	pi = [pi; [ones(npr,1)*r(i) s]];
	wi = [wi; [ones(npr,1)*wr(i) ws]];
end


% ciclo di calcolo
for i=1:npr*nps
	% punto attuale
	ri = pi(i,1);
	si = pi(i,2);
	
	% peso attuale
	wrs = wi(i);
	
	% Shape functions e derivate
	N = Form2D(ri,si,nnod);
	Nrs = Form2DD(ri,si,nnod);
	
	% Jacobiano
	J = [Nrs*xi Nrs*yi];
	
	% Shape functions in coord spaziali
	Nxy = inv(J)*Nrs;
	% recupero matrice B
	B = zeros(3,2*nnod);
	B(1,1:nnod) = Nxy(1,:);
	B(2,nnod+1:end) = Nxy(2,:);
	B(3,1:nnod) = Nxy(2,:);
	B(3,nnod+1:end) = Nxy(1,:);
	
	% assemblaggio matrice
	K = K + B'*C*B*t*det(J);
end

K