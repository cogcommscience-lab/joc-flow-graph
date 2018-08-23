% The null efficiency values are a cell, this makes them a regular array

nullmat_eff_flow = cell2mat(nulleff_flow);

nullmat_eff_bore = cell2mat(nulleff_bore);

nullmat_eff_frust = cell2mat(nulleff_frust);

% And now lets transpose each matrix to a vector

nullvect_eff_flow = nullmat_eff_flow.';

nullvect_eff_bore = nullmat_eff_bore.';

nullvect_eff_frust = nullmat_eff_frust.';

% And lets get some summary stats on each

nullmean_flow = mean(nullvect_eff_flow);

nullstd_flow = std(nullvect_eff_flow);

nullstderror_flow = std(nullvect_eff_flow)/sqrt(length(nullvect_eff_flow));


nullmean_bore = mean(nullvect_eff_bore);

nullstd_bore = std(nullvect_eff_bore);

nullstderror_bore = std(nullvect_eff_bore)/sqrt(length(nullvect_eff_bore));


nullmean_frust = mean(nullvect_eff_frust);

nullstd_frust = std(nullvect_eff_frust);

nullstderror_frust = std(nullvect_eff_frust)/sqrt(length(nullvect_eff_frust));
