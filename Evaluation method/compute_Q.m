function [Q] = compute_Q(adj, com, m2, d)
    Q = 0;
    for i=1:length(adj)
        Q = Q + adj(i,i);
        for j=i+1:length(adj)
            if com(i) == com(j)
                Q = Q + 2*(adj(i,j) - (d(i)*d(j))/m2);
            end
        end
        Q = Q - (d(i)*d(i))/m2;
    end
    Q = Q / m2;
end