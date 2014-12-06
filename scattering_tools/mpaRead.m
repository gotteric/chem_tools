function [image] = mpaRead(filename)
fid= fopen(filename);
formatspec=[];
for i=1:1:1024
    formatspec=[formatspec ' %d'];
end
tline = fgetl(fid);
c=1;
while ischar(tline)
    c=c+1;
    tline = fgetl(fid);
    if(strfind(tline,'[CDAT0'))
        break;
    end   
end
frewind(fid);
data=textscan(fid,formatspec,'HeaderLines',c,'Delimiter','\r\n');
image=double(cell2mat(data));