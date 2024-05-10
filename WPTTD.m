function  [multilayer_Q_value,multilayer_NMI_value,ari_value] = WPTTD(W,base_class)
[x,y] = size(W{1});
z = max(size(W));  
Wl_cell = cell(z,1);
Wl = rand([x,y,z]);
parameter = 0.1; 
maxiter = 200;
wfn = flattening(W);
[S,Q] = louvain(wfn);
L_value = L(wfn); 
feature = size(tabulate(S));
k = feature(1);
wp = WP(S);
for i = 1:z
    Wl_cell{i} = W{i} + parameter*wp;
    Wl(:,:,i) = Wl_cell{i};
end


r = [1,k,k,1];
g = init_TT([x,y,z],r);

for i = 1:maxiter
   g1_1 = Gunfold(Wl,1)*(Gunfold(double(ttt(tensor(g{2}),tensor(g{3}),3,1)),1))'+parameter*0.25*(L_value*g{1}+L_value'*g{1});
   g1_2 = g{1}*Gunfold(double(ttt(tensor(g{2}),tensor(g{3}),3,1)),1)*(Gunfold(double(ttt(tensor(g{2}),tensor(g{3}),3,1)),1))';
   g{1} = g{1}.*(g1_1./g1_2);
  
   g2_1 = Gunfold(Wl,2)*(kron(Gunfold(g{3},1),Gunfold(g{1},2)))';
   g2_2 = Gunfold(g{2},2)*kron(Gunfold(g{3},1),Gunfold(g{1},2))*(kron(Gunfold(g{3},1),Gunfold(g{1},2)))';
   g{2} = Gfold(Gunfold(g{2},2).*(g2_1./g2_2),size(g{2}),2);
   
   g3_1 = Gunfold(Wl,3)*(Gunfold(double(ttt(tensor(g{1}),tensor(g{2}),2,1)),3))';
   g3_2 = Gunfold(g{3},2)*Gunfold(double(ttt(tensor(g{1}),tensor(g{2}),2,1)),3)*(Gunfold(double(ttt(tensor(g{1}),tensor(g{2}),2,1)),3))';
   g{3} = reshape(Gunfold(g{3},2).*(g3_1./g3_2),size(g{3}));

end

S_nmf = gen_S(g{1});
class = node_class(S_nmf);
multilayer_Q_value = multilayer_Q(W,S_nmf);
multilayer_NMI_value = nmi(base_class,S_nmf);
ari_value = adjrandindex(base_class,S_nmf);
fprintf('the multilayer Q is %f, the NMI is %f, the ari is %f\n',multilayer_Q_value,multilayer_NMI_value,ari_value);
end

