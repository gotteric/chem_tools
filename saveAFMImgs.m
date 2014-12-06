files = dir;
files = files(3:end);

for i = 1:length(files)
    name = files(i).name;
    regexp(name,'00\d$')
    if regexp(name,'00\d$')
        
        quicksaveAFM(files(i).name, true)
    end
end

