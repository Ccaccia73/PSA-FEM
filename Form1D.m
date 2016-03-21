function N = Form1D( ri, nnod, type )
%FORM1D Summary of this function goes here
%   Detailed explanation goes here
	
	N = zeros(1, 2*nnod);
	
	if type == 1 % Eulero Bernoulli
		if nnod == 2
			% displ node 1
			N(1) = 0.25 * (1. - ri)^2 * ( 2. + ri);
			% rot node 1
			N(2) = 0.25 * (1. - ri)^2 * ( 1. + ri);
			% displ node 2
			N(3) = 0.25 * (1. + ri)^2 * ( 2. - ri);
			% rot node 2
			N(4) = 0.25 * (1. + ri)^2 * ( ri - 1.);
		else
			
		end
	else
		if nnod == 2
			N(1) = 0.5 * (1. - ri);
			N(2) = N(1);
			N(3) = 0.5 * (1. + ri);
			N(4) = N(3);
		else
			
		end
	end
end

