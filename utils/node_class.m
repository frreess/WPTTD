function res = node_class(S)
    a = size(tabulate(S));
    length = max(size(S));
    max_community = a(1);
    res = cell(max_community,1);
    for i = 1:length
       res{S(i,1),1} = [res{S(i,1),1} i];  
    end
end