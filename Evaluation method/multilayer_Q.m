function res = multilayer_Q(adj,community_class)    
    mu = max(size(adj));
    Q = zeros([mu,1]);
    com = community_class;
    for i = 1:mu
          W = adj{i};
       m2 = sum(sum(W));
        m = m2/2;
        d = sum(W,2);
        Q(i,1) = compute_Q(W, com, m2, d);
%         Q(i) = true_Q(W,com);
    end
    res = sum(Q)/mu;
end