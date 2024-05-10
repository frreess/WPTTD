function res = gen_S(B)
[x,~] = size(B);
res = zeros([x,1]);
for i = 1:x
    [~,index] = max(B(i,1:end));
    res(i,1) = index;
end