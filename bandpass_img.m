function out = bandpass_img(img,minFeat,maxFeat,minSig,maxSig,imgSize)
    % img is a 2d matrix with scalar value
    % imgSize is the physical size of the x direction
    
    dim = size( img );
    nx = dim(1);
    ny = dim(2);
    
    pxSize = imgSize/(nx-1);
    flat = poly_flatten( img, 3 );

    imgFft = fftshift(fft2( flat, nx, ny ));

    filterMat = bandpass(img, minFeat, maxFeat, minSig, maxSig, pxSize);

    filtered = imgFft .* filterMat;
    out = ifft2(ifftshift(filtered));
    out = real(out(1:nx, 1:ny));
end

function filter3 = bandpass( img, minFeat, maxFeat, minSig, maxSig, pxSize )

    dim = size( img );
    nx = dim(1);
    ny = dim(2);
    
    [gridX,gridY] = meshgrid((-nx/2:(nx/2-1))/(nx*pxSize),(-ny/2:(ny/2-1))/(ny*pxSize));

    dist = (gridX.^2+gridY.^2).^0.5;
    filter1 = (erf((dist-1/maxFeat)/maxSig)+1)/2;
    filter2 = 1-(erf((dist-1/minFeat)/minSig)+1)/2;
    filter3 = filter1 .* filter2;
end