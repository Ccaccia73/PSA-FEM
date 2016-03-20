function N = Form2D(ri,si,nnod)
    %Bilinear interpolating functions
    %   Detailed explanation goes here
     %Bilinear weights
     %   x must be a (1x2) vector
     %   weights is a (1x4) vector [N1 N2 N3 N4]
     ndim = 2;
     nnodes = 4;
     N = zeros(1, nnod);
     N(1) = (ri - 1.) * (si - 1.) *  0.25;	 %-1 -1
     N(2) = (ri + 1.) * (si - 1.) * -0.25; % 1 -1
     N(3) = (ri + 1.) * (si + 1.) *  0.25; % 1  1
     N(4) = (ri - 1.) * (si + 1.) * -0.25; %-1  1
end
