% Makes 10000 null distributions for each covariance matrix
% Uses the HQS algorithm from the GAT toolbox

parfor i=1:10000, 8;
permuted_flow_null{i} = hqs(flowcondcovarmatrix);
end

parfor i=1:10000, 8;
permuted_bore_null{i} = hqs(borecondcovarmatrix);
end

parfor i=1:10000, 8;
permuted_frust_null{i} = hqs(frustcondcovarmatrix);
end