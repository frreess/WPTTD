function res = WP(S)
    length = max(size(S));
    res = zeros([length,length]);
    for i = 1:length
        for j = 1:length
            if i ~= j
                if S(i,1) == S(j,1)
                    res(i,j) = 1;
                end
            end
        end
    end
    

end
