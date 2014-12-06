function out = make_topographic_fig(img,title,scale,xAxis,xUnits,yAxis,yUnits)
    % If only 

    if nargin == 3
        build_phase();
    elseif nargin == 5 || nargin == 7
        if nargin == 5
            yAxis = xAxis;
            yUnits = xUnits;
        end
        build_topo();
    else
        error('Improper number of arguments')
    end

end

function out = build_topo()

    figure
    imagesc(img)
    colormap julio
    colorbar

end

function out = build_phase

    figure
    imagesc(img)
    colormap julio


end

function scale_bar()


end