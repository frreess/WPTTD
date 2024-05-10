 function Z_neq_out=Z_neq(Z,D,n)

    Z=circshift(Z,-n); % arrange Z{n} to the last core, so we only need to multiply the first N-1 core
    N=size(Z,1);
    P=tensor(Z{1});  

    for i=1:N-2
        size_N = ndims(P);
        P = ttt(P,tensor(Z{i+1}),size_N,1); %张量缩并
    end
    if n == 1
       D_1 = D{2}; 
       Z_neq_out_tensor = ttm(P,D_1,2); %缩并后的张量形式
    else
       D_1 = D{1};
       Z_neq_out_tensor = ttm(P,D_1,4); %缩并后的张量形式
    end

   
    
    Z_neq_out=reshape(double(Z_neq_out_tensor),size(Z{1},1),numel(double(Z_neq_out_tensor))/ ...
    (size(Z{1},1)*size(Z{N-1},3)),size(Z{N-1},3)); %将tensor转换成三维矩阵

 end