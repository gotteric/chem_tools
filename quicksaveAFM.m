function channel_info = quicksaveAFM( filename, saveImgs )

    if nargin < 2
        saveImgs = false;
    end
    
    [images channel_info] = openNano7_v4(filename);

    numImgs = size(images);
    numImgs = numImgs(3);
    for i = 1:numImgs
        img = images(:,:,i);
        img = zero_flatten(img);
        img = poly_flatten(img, 3);
        img = img - min(img(:));
        
        width = channel_info(i).Width;
        length = channel_info(i).Length;
        unit = channel_info(i).Unit;

        figure(i)
        h = imagesc(img);
        colormap('julio')
        set(gca,'DataAspectRatio',[width length 1]);
        xlabel('nm');
        ylabel('nm');
        hColor = colorbar;
        ylabel(hColor, unit)
        if saveImgs
            name = channel_info(i).Name;
            if mod(i, 2) == 1
                saveFile = [filename '_' name '_trace' '.tif'];
                saveas(h, saveFile)
            else
                saveFile = [filename '_' name '_retrace' '.tif'];
                saveas(h, saveFile)
            end
        end
            
    end
end