function res = density(W,x)
    density_layer = ones(size(W));
    m = max(size(W));
    for i = 1:m
            adj = W{i};
            density_layer(i) = norm(adj-x*x',2);
    end
    res = sum(density_layer)/m;
end