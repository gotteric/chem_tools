function out = bandpass_img( img, sigX, sigY, x0, y0 )

    imgFft = fftshift(fft2( img ));
    filterMat = bandpass( size(img), sigX, sigY, x0, y0 );
    filtered = imgFft .* filterMat;
    out = ifft2( ifftshift(filtered) );
end

function filterMat = bandpass( imgSize, sigX, sigY, x0, y0 )
    % A table of bandpass values are made by using the error
    % function with x and y shifts, and standard deviations
    % of sigX and sigY
    % vals of sig and x0/y0 must be stored as such:
    %   x0 = (high, low)
    % where high and low are x0 for their respective pass filters
    %
    % sig and x0/y0 can also be stand alone vals
    % Then treats high and low vals as the same

    [sigX, sigY, x0, y0] = checkInputs( sigX, sigY, x0, y0 );
    xAxis = ones(imgSize(1));
    yAxis = ones(imgSize(2));

    xHighPass = pass( xAxis, sigX(1), x0(1), 0 );
    xLowPass = pass( xAxis, sigX(2), x0(2), 1 );
    xBand = xHighPass .* xLowPass;

    yHighPass = pass( yAxis, sigY(1), y0(1), 0 );
    yLowPass = pass( yAxis, sigY(2), y0(2), 1 );
    yBand = yHighPass .* yLowPass;

    filterMat = bsxfun( @times, xBand', yBand );
end

function val = pass( x, sigX, x0, isLow )

    erfArg = (-1)^isLow * (x-x0)/(sigX * 2^0.5);
    val = (erf( erfArg ) + 1)/2;
end

function [sigX, sigY, x0, y0] = checkInputs( sigX, sigY, x0, y0 )

    if length( sigX ) == 1
        sigX(2) = sigX(1);
    end
    if length( sigX ) == 1
        sigX(2) = sigX(1);
    end
    if length( sigX ) == 1
        sigX(2) = sigX(1);
    end
    if length( sigX ) == 1
        sigX(2) = sigX(1);
    end

end