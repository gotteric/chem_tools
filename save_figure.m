function out = save_figure( fig, save_as )

    if exist(save_as, 'file')
        error( 'File already exists. Please specify a file that does not exist.')
    end

    file_type = '-dtiff';
    dpi = '-r300';
    
    print( img, file_type, dpi, save_as );
end