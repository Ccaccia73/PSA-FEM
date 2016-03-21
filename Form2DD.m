function Nrs =  Form2DD(ri,si,nnod)
        %Bilinear interpolating functions
        %   Detailed explanation goes here
    
        % ndim = 2;
        % nnodes = 4;
        %Bilinear weight derivatives
        %   x must be a (1x2) vector
        %   ders is a (2x4) vector: ders(i,j) is the partial derivative of
        %   weight j with respect to the coordinate i
        Nrs = zeros(2, nnod);
        Nrs(1, 1) = (si - 1.) *  0.25;   %-1 -1
        Nrs(1, 2) = (si - 1.) * -0.25;   % 1 -1
        Nrs(1, 3) = (si + 1.) *  0.25;   % 1  1
        Nrs(1, 4) = (si + 1.) * -0.25;   %-1  1
        Nrs(2, 1) = (ri - 1.) *  0.25;   %-1 -1
        Nrs(2, 2) = (ri + 1.) * -0.25;   % 1 -1
        Nrs(2, 3) = (ri + 1.) *  0.25;   % 1  1
        Nrs(2, 4) = (ri - 1.) * -0.25;   %-1  1
		
		if nnod == 8
			Nrs(5,1) = 0.5 * (1 - si) * ( -2. * ri);
			Nrs(5,2) = 0.5 * (1 - ri^2) * ( -1.);

			Nrs(6,1) = 0.5 * (1 - si^2);
			Nrs(6,2) = 0.5 * (1 + ri) * ( -2. * si);
			
			Nrs(7,1) = 0.5 * (1 + si) * ( -2. * ri);
			Nrs(7,2) = 0.5 * (1 - ri^2);
			
			Nrs(8,1) = 0.5 * (1 - si^2) * ( -1.);
			Nrs(8,2) = 0.5 * (1 - ri) * (-2. * si);
			
			Nrs(1,1) = Nrs(1,1) - 0.5 * Nrs(5,1);
			Nrs(1,2) = Nrs(1,2) - 0.5 * Nrs(5,2);
			
			Nrs(2,1) = Nrs(2,1) - 0.5 * Nrs(5,1);
			Nrs(2,2) = Nrs(2,2) - 0.5 * Nrs(5,2);
			
			Nrs(2,1) = Nrs(2,1) - 0.5 * Nrs(6,1);
			Nrs(2,2) = Nrs(2,2) - 0.5 * Nrs(6,2);

			Nrs(3,1) = Nrs(3,1) - 0.5 * Nrs(6,1);
			Nrs(3,2) = Nrs(3,2) - 0.5 * Nrs(6,2);
			
			Nrs(3,1) = Nrs(3,1) - 0.5 * Nrs(7,1);
			Nrs(3,2) = Nrs(3,2) - 0.5 * Nrs(7,2);
			
			Nrs(4,1) = Nrs(4,1) - 0.5 * Nrs(7,1);
			Nrs(4,2) = Nrs(4,2) - 0.5 * Nrs(7,2);
			
			Nrs(4,1) = Nrs(4,1) - 0.5 * Nrs(8,1);
			Nrs(4,2) = Nrs(4,2) - 0.5 * Nrs(8,2);
			
			Nrs(1,1) = Nrs(1,1) - 0.5 * Nrs(8,1);
			Nrs(1,2) = Nrs(1,2) - 0.5 * Nrs(8,2);

		end
end
