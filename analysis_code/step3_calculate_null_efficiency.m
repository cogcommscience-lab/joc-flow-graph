
% Threshold each null adjacency matrix at a 10% density

parfor j = 1:10000, 8;
    permuted_flow_null_thresh{j} = threshold_proportional(permuted_flow_null{1, j},.1);
end

parfor j = 1:10000, 8;
    permuted_bore_null_thresh{j} = threshold_proportional(permuted_bore_null{1, j},.1);
end

parfor j = 1:10000, 8;
    permuted_frust_null_thresh{j} = threshold_proportional(permuted_frust_null{1, j},.1);
end


% Make each thresholded null adjacency matrix binary

parfor j = 1:10000, 8;
    permuted_flow_null_bin{j} = weight_conversion(permuted_flow_null_thresh{1, j},'binarize');
end

parfor j = 1:10000, 8;
    permuted_bore_null_bin{j} = weight_conversion(permuted_bore_null_thresh{1, j},'binarize');
end

parfor j = 1:10000, 8;
    permuted_frust_null_bin{j} = weight_conversion(permuted_frust_null_thresh{1, j},'binarize');
end


% Calculate the efficiency for all null models

parfor j=1:10000, 8;
nulleff_flow{j} = efficiency_bin(permuted_flow_null_bin{1, j});
end

parfor j=1:10000, 8;
nulleff_bore{j} = efficiency_bin(permuted_bore_null_bin{1, j});
end

parfor j=1:10000, 8;
nulleff_frust{j} = efficiency_bin(permuted_frust_null_bin{1, j});
end