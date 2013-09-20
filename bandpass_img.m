function out = bandpass_img( img, bandLow, bandHigh )
    % img is a 2d matrix with scalar value
    pxSize = 2000/(1024-1);%update to take imgSize then do pxSize = that / ( dim-1)
    flat = poly_flatten( img, 3 );

    dim = size( img );
    nx = dim(1);
    ny = dim(2);

    imgFft = fftshift(fft2( flat, nx, ny ));

    filterMat = bandpass( img, bandLow, bandHigh, pxSize );

    filtered = imgFft .* filterMat;
    out = ifft2(ifftshift(filtered));
    out = real(out(1:nx, 1:ny));
end

function filter3 = bandpass( img, bandLow, bandHigh, pxSize )

    dim = size( img );
    nx = dim(1);
    ny = dim(2);
    
    [freqGridX,freqGridY] = meshgrid((-nx/2:(nx/2-1))/(nx*pxSize),(-ny/2:(ny/2-1))/(ny*pxSize));
    
    filter1 = freqGridX * 0;
    filter2 = freqGridX * 0;

    for i = 1:nx
        for j = 1:ny
            dist = (freqGridX(i,j)^2+freqGridY(i,j)^2)^0.5;

            filter1(i,j) = exp(-bandLow^2 * dist^2 / 2);
            filter2(i,j) = 1 - exp(-bandHigh^2 * dist^2 / 2);
        end
    end
    filter3 = filter1 .* filter2;
end