function res = L(W)
    adj = W;
    degree=sum(adj,1)'+sum(adj,2)-diag(adj);
    D = spdiags(degree, 0, size(adj, 1), size(adj, 2));
    L_matrix = D - adj;
    res = L_matrix;
end