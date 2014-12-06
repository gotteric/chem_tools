function [center,det_dist_in_px]=SAXS_q_calibration(dat,lambda)

ag_beh = 58.380e-10;

center = find_txs_center(dat);
[r_list,polar] = quick_polar(dat,center);
radial_mean = mean(polar);

[~,px_max] = imax(log(radial_mean).*r_list);
px_max = px_max + r_list(1);
q_ag_beh = 2*pi/ag_beh;
det_dist_in_px = px_max/tan(asin(q_ag_beh*lambda/(4*pi)));

