function N = Form2D(ri,si,nnod)
    %Bilinear interpolating functions
    %   Detailed explanation goes here
     %Bilinear weights
     %   x must be a (1x2) vector
     %   weights is a (1x4) vector [N1 N2 N3 N4]
     %ndim = 2;
     %nnodes = 4;
     N = zeros(1, nnod);
     N(1) = 0.25 * (1. - ri) * (1. - si);	 %-1 -1
     N(2) = 0.25 * (1. + ri) * (1. - si); % 1 -1
     N(3) = 0.25 * (1. + ri) * (1. + si); % 1  1
     N(4) = 0.25 * (1. - ri) * (1. + si); %-1  1
	 
	 if nnod == 8
		 N(5) = 0.5 * (1. - ri^2)*(1. - si); % 0 -1
		 N(6) = 0.5 * (1. - si^2)*(1. + ri); % 1 0
		 N(7) = 0.5 * (1. - ri^2)*(1. + si); % 0 1
		 N(8) = 0.5 * (1. - si^2)*(1. - ri); % -1 0
		 
		 N(1) = N(1) - N(5)/2;
		 N(2) = N(2) - N(5)/2;
		 
		 N(2) = N(2) - N(6)/2;
		 N(3) = N(3) - N(6)/2;
		 
		 N(3) = N(3) - N(7)/2;
		 N(4) = N(4) - N(7)/2;
		 
		 N(4) = N(4) - N(8)/2;
		 N(1) = N(1) - N(8)/2;
	 end
end
