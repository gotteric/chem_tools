function out = bandpass_img( img, sig1, sig2 )
    % img is a 2d matrix with scalar value
    
    flat = poly_flatten( img, 3 );

    dim = size( img );
    nx = dim(1);
    ny = dim(2);

    imgFft = fftshift(fft2( flat, 2*nx-1, 2*ny-1 ));

    filterMat = bandpass( img, sig1, sig2 );

    filtered = imgFft .* filterMat;
    out = ifft2(ifftshift(filtered));
    out = real(out(1:nx, 1:ny));
end

function filter3 = bandpass( img, sig1, sig2 )

    dim = size( img );
    nx = dim(1);
    ny = dim(2);

    filter1 = ones(2*nx-1,2*ny-1);
    filter2 = ones(2*nx-1,2*ny-1);
    filter3 = ones(2*nx-1,2*ny-1);

    for i = 1:2*nx-1
        for j = 1:2*ny-1
            dist = ((i - (nx + 1))^2 + (j - (ny + 1))^2)^.5;

            filter1(i,j) = exp(-dist^2/(2*sig1^2));
            filter2(i,j) = 1 - exp(-dist^2/(2*sig2^2));
        end
    end
    filter3 = filter1 .* filter2;
end