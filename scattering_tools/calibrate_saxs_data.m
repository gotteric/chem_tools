function [polar,q,theta] = calibrate_saxs_data(...
    dat,center,det_dist_in_px,lambda)

x0 = center(1);
y0 = center(2);
[x_f, y_f] = size(dat);
r_max = min([x0,y0,x_f-x0,y_f-y0]);
[x_px,y_px] = meshgrid(1:x_f,1:y_f);
x_px_centered = x_px-x0;
y_px_centered = y_px-y0;
dist_mat = floor((x_px_centered.^2.+y_px_centered.^2).^0.5);
n_theta_max = sum(sum(dist_mat==floor(r_max)));
[r, theta] = meshgrid(1:r_max, 0:2*pi/n_theta_max:2*pi);
x_pol = r.*cos(theta);
y_pol = r.*sin(theta);
polar = interp2(x_px_centered,y_px_centered,dat,x_pol,y_pol,'natural');


q = 4*pi/lambda*sin(atan(r/det_dist_in_px));