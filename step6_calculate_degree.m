% Calculate the degree on the undirected binary flow adjacency matrix 

degree_flow = degrees_und(bin_flow);

% Calculate the degree on the undirected binary bore adjacency matrix 

degree_bore = degrees_und(bin_bore);

% Calculate the degree on the undirected binary frust adjacency matrix 

degree_frust = degrees_und(bin_frust);


% Transpose each matrix

degree_flow = (degree_flow)';

degree_bore = (degree_bore)';

degree_frust = (degree_frust)';


% Sum all rows in each null matrix

parfor j=1:10000, 8;
    nullsum_bore{j} = sum(permuted_bore_null{1,j});
end

parfor j=1:10000, 8;
    nullsum_flow{j} = sum(permuted_flow_null{1,j});
end

parfor j=1:10000, 8;
    nullsum_frust{j} = sum(permuted_frust_null{1,j});
end

% Transpose all values

parfor j=1:10000, 8;
    nullsum_bore_transpose{j} = nullsum_bore{1,j}.';
end

parfor j=1:10000, 8;
    nullsum_flow_transpose{j} = nullsum_flow{1,j}.';
end

parfor j=1:10000, 8;
    nullsum_frust_transpose{j} = nullsum_frust{1,j}.';
end


% Make a 1x10000 cell with the node key

node_key_cell = cell(1,10000);

parfor idx = 1:10000, 8;
    node_key_cell{idx} = node_key;
end

% Total degree for each network across all null graphs

parfor j=1:10000, 8;
    datasum_bore{j} = accumarray(node_key_cell{1,j},nullsum_bore_transpose{1,j});
end

parfor j=1:10000, 8;
    datasum_flow{j} = accumarray(node_key_cell{1,j},nullsum_flow_transpose{1,j});
end

parfor j=1:10000, 8;
    datasum_frust{j} = accumarray(node_key_cell{1,j},nullsum_frust_transpose{1,j});
end

% Calculate Average Degree

index_cell = cell(1,10000);

index = ones(size(node_key));

parfor idx = 1:10000, 8;
    index_cell{idx} = index;
end

parfor j=1:10000, 8;
    datacount{j} = accumarray(node_key_cell{1,j},index_cell{1,j});
end

parfor j=1:10000, 8;
    average_degree_bore{j} = datasum_bore{1,j}./datacount{1,j};
end

parfor j=1:10000, 8;
    average_degree_flow{j} = datasum_flow{1,j}./datacount{1,j};
end

parfor j=1:10000, 8;
    average_degree_frust{j} = datasum_frust{1,j}./datacount{1,j};
end

% Now lets make these cells matricies

average_degree_mat_bore = cell2mat(average_degree_bore);

average_degree_mat_flow = cell2mat(average_degree_flow);

average_degree_mat_frust = cell2mat(average_degree_frust);

% And now transpose so that a mean can be calculated
% IMPORTANT: Each column is a network, starting at 1 (Sensory/somatomotor
% Hand)and ending at 14 (undefined, normally -1 in Power Key)

null_average_degree_bore = average_degree_mat_bore.';

null_average_degree_flow = average_degree_mat_flow.';

null_average_degree_frust = average_degree_mat_frust.';

% And now calculate average degree for empirical data
% This borrows some variables generated above, specifically index and node
% key

datasum_vect_bore = accumarray(node_key,degree_bore);

datasum_vect_flow = accumarray(node_key,degree_flow);

datasum_vect_frust = accumarray(node_key,degree_frust);

datacount_vect = accumarray(node_key,index);

average_degree_bore_empirical = datasum_vect_bore./datacount_vect;

average_degree_flow_empirical = datasum_vect_flow./datacount_vect;

average_degree_frust_empirical = datasum_vect_frust./datacount_vect;