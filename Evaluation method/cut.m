%function res = cut(W,X)
W = load('./data/real_world/Lazega-Law-Firm_multiplex.mat');
W = W.mul;
x = load('matlab.mat');
x = x.g;
x = x{1};
L = cell(size(W));
cut_layer = ones(size(W));
m = max(size(W));
    for i = 1:m
        adj = W{i};
        degree=sum(adj,1)'+sum(adj,2)-diag(adj);
        D = spdiags(degree, 0, size(adj, 1), size(adj, 2));
        L{i} = D - adj;
        cut_layer(i) = trace(x'*L{i}*x);
    end
    res = sum(cut_layer)/m;
    