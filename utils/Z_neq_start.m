 function Z_neq_out=Z_neq_start(Z,n)

    Z=circshift(Z,-n); % arrange Z{n} to the last core, so we only need to multiply the first N-1 core
    N=size(Z,1);
    P=tensor(Z{1});  

    for i=1:N-2
        size_N = ndims(P);
        P = ttt(P,tensor(Z{i+1}),size_N,1); %��������
    end
    
    Z_neq_out=reshape(double(P),size(Z{1},1),numel(double(P))/ ...
    (size(Z{1},1)*size(Z{N-1},3)),size(Z{N-1},3)); 

 end