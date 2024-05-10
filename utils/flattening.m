function res = flattening(W)
    layer = max(size(W));
    L = zeros(layer,1);
    a = zeros(layer,1);
    res = zeros(size(W{1}));
    for i = 1:layer
        L(i) = sum(sum(W{i}));
    end
    L_sum = sum(L);
    for i = 1:layer
        a(i) = L(i)/L_sum;
        res = res + a(i).*W{i};
    end