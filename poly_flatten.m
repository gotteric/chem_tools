function out = poly_flatten( img, degX, degY )
	% deg is the degree polynomial use to fit, must be less than 5
	% img is a 2d matrix with values nums

    if nargin < 3
        degY = degX;
    end

    imgSize = size(img);
    [xGrid, yGrid] = meshgrid( 1:imgSize(1), 1:imgSize(2) );

    polyStr = ['poly', num2str(degX), num2str(degY)];
    fitSurface = fit( [xGrid(:), yGrid(:)], img(:), polyStr );
    
    out = img;
    fitPoints = fitSurface( xGrid, yGrid );
    out = img - fitPoints;
end