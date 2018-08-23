% Thresholds, bins, and calculates summary stats on matricies


% Threshold each adjacency matrix at a 10% density

thresh_flow = threshold_proportional(flowcondcorelmatrix,.1);

thresh_bore = threshold_proportional(borecondcorelmatrix,.1);

thresh_frust = threshold_proportional(frustcondcorelmatrix,.1);


% Make each thresholded adjacency matrix binary

bin_flow = weight_conversion(thresh_flow,'binarize');

bin_bore = weight_conversion(thresh_bore,'binarize');

bin_frust = weight_conversion(thresh_frust,'binarize');


% Check the density of each network

den_flow = density_und(bin_flow);

den_bore = density_und(bin_bore);

den_frust = density_und(bin_frust);


% Calculate global efficiency for each adjacency matrix

eff_flow = efficiency_bin(bin_flow);

eff_bore = efficiency_bin(bin_bore);

eff_frust = efficiency_bin(bin_frust);