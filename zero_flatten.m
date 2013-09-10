function flat = zero_flatten( img, direction )

    if nargin < 2
        direction = 'x'
    end
    if strcmp( direction, 'x' )
        flat = xFlatten( img );
    elseif strcmp( direction, 'y')
        flat = yFlatten( img );
    else
        disp( 'incorrect input for direction, must be "x" or "y"' )''
    end
end

function xFlat = xFlatten( img )

    xFlat = img;
    for i = 1:size( img, 1 )
        meanVal = mean( img(i,:) );
        xFlat(i,:) = img(i,:) - meanVal;
    end
end

function yFlat = yFlatten( img )

    yFlat = img;
    for i = 1:size( img, 2 )
        meanVal = mean( img(:,i) );
        xFlat(:,i) = img(:,i) - meanVal;
    end
end