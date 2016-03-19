% Script calcolo matrice di rigidezza in 2D



% num nodi per elemento
nnod = 4;

% # gdl per nodo
gdl = 2;


% num punti di integrazione per ogni dimensione
npr = 2;
nps = 2;

% recupero Gauss points e pesi
[r, wr] = lgwt(npr,-1,1);
[s, ws] = lgwt(nps,-1,1);


% inizializzazione matrice di rigidezza
K = [];


% inizializzazione matrice complessiva punti di Gauss e pesi
pi = [];
wi = [];

% ciclo costruzione matrici punti e pesi
for i=1:npi
	pi = [pi; [ones(npi,1)*r(i) s]];
	wi = [wi; [ones(npi,1)*wr(i) ws]];
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
	
	% calcolo coordinate spaziali dei pti di Gauss
	xy = invTransf(ri,si);
	
	% Jacobiano
	J = Nrs*xy;
	
	% Shape functions in coord spaziali
	Nxy = inv(J)*Nrs;
	% recupero matrice B
	B = buildMat(Nxy);
	
	% assemblaggio matrice
	K = K + B'*C*B*t*det(J);
end
