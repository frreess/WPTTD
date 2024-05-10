function dn = init_dn(G)
    N = size(G,1);
    for i = 1:N
        n = size(G{i},2);
        dn_a = rand(n,1);
        dn{i} = diag(dn_a);
    end
end