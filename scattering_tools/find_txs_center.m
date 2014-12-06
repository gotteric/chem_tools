function center = find_txs_center(raw_data)
% INPUT: 2D matrix of TXS intensities
% OUTPUT: x and y values in px number of the beam center (floats)
% ASSUMPTIONS: Needs a radial max that can be exploited
% 
%
% Written by Eric Gottlieb

binary = (raw_data ~=  0);
mat_size = size(binary);
[x,y] = meshgrid(1:mat_size(1),1:mat_size(2));
x_guess = floor(mean(x(binary)));
y_guess = floor(mean(y(binary)));

f = @(x)radial_variance(raw_data,x);
opts = optimset('PlotFcns',@optimplotfval);
center=fminsearch(f,[x_guess,y_guess],opts);
