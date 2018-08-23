% This code calculates a paired-samples t-test. It is the first formula
% explained in Snijders & Borgatti (1999, Connections) for calculating a
% paired samples t-test. Note, this makes the assumptuons that your permuted 
% distributions are normal

%%% Bootstraped SE for paired samples t-test Flow less Bore

% Vector of differences in efficiency flow - bore

flow_bore_null_eff_diff = nullvect_eff_flow - nullvect_eff_bore;

% Get the mean of the differences

mean_flow_bore_null_eff_diff = mean(flow_bore_null_eff_diff);

% Make a vector of the mean difference, length of each null vect

vect_of_ones = ones(10000,1);

mean_vect_flow_bore_eff_diff = vect_of_ones * mean_flow_bore_null_eff_diff;

% subtract each difference by mean difference

diff_obs_mean_flow_bore = flow_bore_null_eff_diff - mean_vect_flow_bore_eff_diff;

% Square each element of the vector

square_diff_obs_mean_flow_bore = diff_obs_mean_flow_bore.^2;

% Sum all elements in the vector

sumsquare_diff_obs_mean_flow_bore = sum(square_diff_obs_mean_flow_bore);

% Make 1/(m-1) where m = number of permuations

one_over_m_less_one = 1/9999;

%multiply 1/(m-1) by sum of vector elements

almostdone_flow_bore = one_over_m_less_one * sumsquare_diff_obs_mean_flow_bore;

% take root of result

seb_flow_less_bore = sqrt(almostdone_flow_bore);

%make numerator in paired t-test flow - bore

diff_eff_real_data_flow_less_bore = eff_flow - eff_bore;

t_flow_less_bore_eff_sb = diff_eff_real_data_flow_less_bore / seb_flow_less_bore;



%%%%% Bootstraped SE for paired samples t-test Flow less Frust


% Vector of differences in efficiency flow - frust

flow_frust_null_eff_diff = nullvect_eff_flow - nullvect_eff_frust;

% Get the mean of the differences

mean_flow_frust_null_eff_diff = mean(flow_frust_null_eff_diff);

% Make a vector of the mean difference, length of each null vect

vect_of_ones = ones(10000,1);

mean_vect_flow_frust_eff_diff = vect_of_ones * mean_flow_frust_null_eff_diff;

% subtract each difference by mean difference

diff_obs_mean_flow_frust = flow_frust_null_eff_diff - mean_vect_flow_frust_eff_diff;

% Square each element of the vector

square_diff_obs_mean_flow_frust = diff_obs_mean_flow_frust.^2;

% Sum all elements in the vector

sumsquare_diff_obs_mean_flow_frust = sum(square_diff_obs_mean_flow_frust);

% Make 1/(m-1) where m = number of permuations

one_over_m_less_one = 1/9999;

%multiply 1/(m-1) by sum of vector elements

almostdone_flow_frust = one_over_m_less_one * sumsquare_diff_obs_mean_flow_frust;

% take root of result

seb_flow_less_frust = sqrt(almostdone_flow_frust);


%make numerator in paired t-test flow - frust

diff_eff_real_data_flow_less_frust = eff_flow - eff_frust;

t_flow_less_frust_eff_sb = diff_eff_real_data_flow_less_frust / seb_flow_less_frust;

