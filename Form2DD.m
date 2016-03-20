function Nrs =  Form2DD(ri,si,nnod)
        %Bilinear interpolating functions
        %   Detailed explanation goes here
    
        ndim = 2;
        nnodes = 4;
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
end
