% Lets have a look at the degree distributions

% Get degree for each bin/thresh graph

degree_bore = degrees_und(bin_bore);

degree_flow = degrees_und(bin_flow);

degree_frust = degrees_und(bin_frust);

% And transpose so you get a 264x1 matrix

degree_bore = degree_bore.';

degree_flow = degree_flow.';

degree_frust = degree_frust.';

% And plot some histograms

hist_bore_degree = histogram(degree_bore);

figure()

hist_flow_degree = histogram(degree_flow);

figure()

hist_frust_degree = histogram(degree_frust);

figure()


% Make histograms for null degree distributions at given threshold

parfor j=1:10000,8;
    null_degree_hist_bore{j} = degrees_und(permuted_bore_null_bin{1, j});
end

hist_bore_degree_null = histogram(cell2mat(cellfun(@(x)x(:),null_degree_hist_bore(:),'un',0)));

figure()

parfor j=1:10000,8;
    null_degree_hist_flow{j} = degrees_und(permuted_flow_null_bin{1, j});
end

hist_flow_degree_null = histogram(cell2mat(cellfun(@(x)x(:),null_degree_hist_flow(:),'un',0)));

figure()

parfor j=1:10000,8;
    null_degree_hist_frust{j} = degrees_und(permuted_frust_null_bin{1, j});
end

hist_frust_degree_null = histogram(cell2mat(cellfun(@(x)x(:),null_degree_hist_frust(:),'un',0)));