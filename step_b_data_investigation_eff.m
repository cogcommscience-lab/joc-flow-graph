% Lets have a look at the eff distributions

% Make histograms for null eff distributions at given threshold

parfor j=1:10000,8
    null_eff_hist_bore{j} = efficiency_bin(permuted_bore_null_bin{1, j})
end

hist_bore_eff_null = histogram(cell2mat(cellfun(@(x)x(:),null_eff_hist_bore(:),'un',0)))

figure()

parfor j=1:10000,8
    null_eff_hist_flow{j} = efficiency_bin(permuted_flow_null_bin{1, j})
end

hist_flow_eff_null = histogram(cell2mat(cellfun(@(x)x(:),null_eff_hist_flow(:),'un',0)))

figure()

parfor j=1:10000,8
    null_eff_hist_frust{j} = efficiency_bin(permuted_frust_null_bin{1, j})
end

hist_frust_eff_null = histogram(cell2mat(cellfun(@(x)x(:),null_eff_hist_frust(:),'un',0)))
