function stdev_dist = radial_variance(data,coords)
% Converts data into radial coords as center vals
% Outputs standard deviation of the max line formed
% The better coords is as a center, the smaller the standard deviation


x_center = coords(1);
y_center = coords(2);
radius_start = 0.1; % in percent
radius_reduction = 0.9;
[x,y] = size(data);

[x_grid,y_grid] = meshgrid(1:x,1:y);
x_grid = x_grid - x_center;
y_grid = y_grid - y_center;
[phi,r] = cart2pol(x_grid,y_grid);
r_list = r(round(y_center),floor(x_center):end);
r_list = r_list(floor(end*radius_start):floor(end*radius_reduction));
phi_list = sort(phi(floor(r)==floor(radius_start*x/2)));
[r_grid,phi_grid] = meshgrid(r_list,phi_list);
x_polar = floor(r_grid .* cos(phi_grid)) + floor(x_center);
y_polar = floor(r_grid .* sin(phi_grid)) + floor(y_center);
polar_indexing = sub2ind(size(data),y_polar,x_polar);
polar_data = data(polar_indexing);

weighted_data = log(polar_data).*r_grid;
imagesc(weighted_data);
[~,I] = max(weighted_data,[],2);
stdev_dist = std(I);
end