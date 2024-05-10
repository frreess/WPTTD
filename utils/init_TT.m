function Z=init_TT(S,r)
N=numel(S);
Z=cell(N,1);
for i=1:N-1
    Z{i}=rand(r(i),S(i),r(i+1));
end
    Z{N}=rand(r(N),S(N),r(1));
    Z{1} = reshape(Z{1},[S(1),r(2)]);
end