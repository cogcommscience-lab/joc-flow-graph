% This code calculates a paired-samples t-test. It is the first formula
% explained in Snijders & Borgatti (1999, Connections) for calculating a
% paired samples t-test.

%%% Bootstraped SE for paired samples t-test Flow less Bore

% Vector of differences in desnity flow - bore

null_diff_degree_flow_less_bore = null_average_degree_flow - null_average_degree_bore;

% Get the mean of the differences

mean_flow_bore_null_degree_diff = mean(null_diff_degree_flow_less_bore);

% Make a vector of the mean difference, length of each null vect

vect_of_ones = ones(10000,1);

mean_vect_flow_bore_degree_diff = vect_of_ones * mean_flow_bore_null_degree_diff;

% subtract each difference by mean difference

diff_obs_mean_degree_flow_bore = null_diff_degree_flow_less_bore - mean_vect_flow_bore_degree_diff;

% Square each element of the vector

square_diff_obs_mean_degree_flow_bore = diff_obs_mean_degree_flow_bore.^2;

% Sum all elements in the vector

sumsquare_diff_obs_mean_degree_flow_bore = sum(square_diff_obs_mean_degree_flow_bore);

sumsquare_diff_obs_mean_degree_flow_bore = sumsquare_diff_obs_mean_degree_flow_bore.';

% Make 1/(m-1) where m = number of permuations

one_over_m_less_one = 1/9999;

%multiply 1/(m-1) by sum of vector elements

almostdone_degree_flow_bore = one_over_m_less_one * sumsquare_diff_obs_mean_degree_flow_bore;

% take root of result

seb_degree_flow_less_bore = sqrt(almostdone_degree_flow_bore);

%make numerator in paired t-test flow - bore

diff_eff_real_data_degree_flow_less_bore = average_degree_flow_empirical - average_degree_bore_empirical;

t_flow_less_bore_degree_sb = diff_eff_real_data_degree_flow_less_bore ./ seb_degree_flow_less_bore;




% This code calculates a paired-samples t-test. It is the first formula
% explained in Snijders & Borgatti (1999, Connections) for calculating a
% paired samples t-test. Note, this makes the assumptuons that your permuted 
% distributions are normal

%%% Bootstraped SE for paired samples t-test Flow less frust

% Vector of differences in desnity flow - frust

null_diff_degree_flow_less_frust = null_average_degree_flow - null_average_degree_frust;

% Get the mean of the differences

mean_flow_frust_null_degree_diff = mean(null_diff_degree_flow_less_frust);

% Make a vector of the mean difference, length of each null vect

vect_of_ones = ones(10000,1);

mean_vect_flow_frust_degree_diff = vect_of_ones * mean_flow_frust_null_degree_diff;

% subtract each difference by mean difference

diff_obs_mean_degree_flow_frust = null_diff_degree_flow_less_frust - mean_vect_flow_frust_degree_diff;

% Square each element of the vector

square_diff_obs_mean_degree_flow_frust = diff_obs_mean_degree_flow_frust.^2;

% Sum all elements in the vector

sumsquare_diff_obs_mean_degree_flow_frust = sum(square_diff_obs_mean_degree_flow_frust);

sumsquare_diff_obs_mean_degree_flow_frust = sumsquare_diff_obs_mean_degree_flow_frust.';

% Make 1/(m-1) where m = number of permuations

one_over_m_less_one = 1/9999;

%multiply 1/(m-1) by sum of vector elements

almostdone_degree_flow_frust = one_over_m_less_one * sumsquare_diff_obs_mean_degree_flow_frust;

% take root of result

seb_degree_flow_less_frust = sqrt(almostdone_degree_flow_frust);

%make numerator in paired t-test flow - frust

diff_eff_real_data_degree_flow_less_frust = average_degree_flow_empirical - average_degree_frust_empirical;

t_flow_less_frust_degree_sb = diff_eff_real_data_degree_flow_less_frust ./ seb_degree_flow_less_frust;
