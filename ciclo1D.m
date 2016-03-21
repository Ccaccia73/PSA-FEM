% Script calcolo matrice di rigidezza in 2D

% num nodi per elemento
nnod = 2;

% coordinate dei nodi in rif globale

if nnod == 4
	xi = [0, 10]';
else
	xi = [0, 10, 5]';
end

% # gdl per nodo
gdl = 2;


% num punti di integrazione per ogni dimensione
npr = 2;

% recupero Gauss points e pesi
[r, wr] = lgwt(npr,-1,1);


% inizializzazione matrice di rigidezza
K = zeros(nnod*gdl);

% matrice rigidezza stato di sforzo piano
% modulo di Young
E = 72e3;
% Inerzia della sezione (costante)
I = 1.;

% coefficiente di talgio
ks = 5./6.;



% ciclo di calcolo
for i=1:npr
	% punto attuale
	ri = pi(i);
	
	% peso attuale
	wr = wi(i);
	
	% Shape functions e derivate
	N = Form1D(ri,nnod,1); % 1 Eulero / 2 Timoshenko
	Nr = Form1DD(ri,si,nnod);
	
	% Jacobiano
	J = [Nr*xi];
	
	% Shape functions in coord spaziali
	Nxy = inv(J)*Nr;
	% recupero matrice B
	B = zeros(3,2*nnod);
	B(1,1:nnod) = Nxy(1,:);
	B(2,nnod+1:end) = Nxy(2,:);
	B(3,1:nnod) = Nxy(2,:);
	B(3,nnod+1:end) = Nxy(1,:);
	
	% assemblaggio matrice
	K = K + B'*C*B*det(J);
end

K