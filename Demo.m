%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% run path
currentFolder = pwd;
cd(currentFolder);

subFolders = dir(currentFolder);
subFolders = {subFolders([subFolders.isdir]).name};

for i = 1:length(subFolders)
    addpath(fullfile(currentFolder, subFolders{i}));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

text_count = 100;  
 
 input = load('./data/LFR/AGN4/0.1.mat');
 base_class = input.idx;
 W = input.mul;
 Q = zeros(text_count,1);
 nmi = zeros(text_count,1);
 ari = zeros(text_count,1);
 for i = 1:text_count
     [Q(i),nmi(i),ari(i)] = WPTTD(W,base_class);
 end
 Q_end = sum(Q)/text_count;
 nmi_end = sum(nmi)/text_count;
 ari_end = sum(ari)/text_count;
 
 