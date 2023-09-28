function lossMtx = WS_pdist2(con_i,con_j)
%lossMtx = WS_pdist2(con_i,con_j)
%    
% Compute matrix whose entries are pairwise Wasserstein distance. 
% The method is explained in Simulation study 2 in 
%
% [1] Generate random modular network introduced in Songdechakraiwut, T. Chung, 
% M.K. 2022 Topological learning for brain networks, Annals of Applied Statistics arXiv: 2012.00675.
% 
% [2] Songdechakraiwut, T., Shen, L., Chung, M.K. 2021 Topological learning and 
% its application to multimodal brain network integration, Medical Image 
% Computing and Computer Assisted Intervention (MICCAI), LNCS 12902:166-176 
%
% INPUT
% con_i,con_j  : two groups of networks. The size of X matrix should be p x p x n_Group_i 
%                                  The size of Y matrix should be p x p x n_Group_j 
%
% If code generates errors, you need to put extremly small random noise 
% such that no entry is indetical to each other. For instance,
% con_pi = con_pi + normrnd(0,0.00001,116,116,nGroup_pi);
% con_co = con_co + normrnd(0,0.00001,116,116,nGroup_co);
%
% OUTPUT
% lossMtx : loss matrices
% lossMtx.D0: 0D-distance 
% lossMtx.D1: 1D-disatnce
% lossMtX.D01: 0D-distance  + 1D-distance combined
%
% The code is part of PH-STAT (Statitical Inference on Persistent Homology) package
% and downloaded from https://github.com/laplcebeltrami/PH-STAT

% (C) 2022 Moo K. Chung
%     University of Wisconsin-Madison
% mkchung@wisc.edu 
%
%  Update history
%     2022 November 5, Chung, The code replaces WS_distancemat.m that is extremly slow due to double-loop.
%     2023 Feb 10, Chung. Squared distance has been used
%

nGroup_i = size(con_i,3);
nGroup_j = size(con_j,3);

% p = size(con_i,1); % # of nodes
% Wb_i = zeros(p-1,nGroup_i);
% Wd_i = zeros((p-1)*(p-2)/2, nGroup_i);

%birth-death decompositon
for i=1:nGroup_i
    
    [Wb Wd] = WS_decompose(con_i(:,:,i));
    Wb_i(i,:) =Wb(:,3);
    Wd_i(i,:) =Wd(:,3);
end

% Wb_j = zeros(p-1,nGroup_j);
% Wd_j = zeros((p-1)*(p-2)/2, nGroup_j);

for j=1:nGroup_j
    [Wb Wd] = WS_decompose(con_j(:,:,j));
    Wb_j(j,:) =Wb(:,3);
    Wd_j(j,:) =Wd(:,3);
end

%squared 0D distance
X=[Wb_i];  %figure; imagesc(X)
Y=[Wb_j];  %figure; imagesc(Y)

D11 = pdist2(X,X,'euclidean');
D12 = pdist2(X,Y,'euclidean');
D21 = D12';
D22 = pdist2(Y,Y,'euclidean');

D=[D11 D12;
   D21 D22];

lossMtx.D0=D.^2; 


%squared 1D distance
X=[Wd_i];  %figure; imagesc(X)
Y=[Wd_j];  %figure; imagesc(Y)

D11 = pdist2(X,X,'euclidean');
D12 = pdist2(X,Y,'euclidean');
D21 = D12';
D22 = pdist2(Y,Y,'euclidean');

D=[D11 D12;
   D21 D22];

lossMtx.D1=D.^2;



%combined squared distance

X=[Wb_i Wd_i];  %figure; imagesc(X)
Y=[Wb_j Wd_j];  %figure; imagesc(Y)

D11 = pdist2(X,X,'euclidean');
D12 = pdist2(X,Y,'euclidean');
D21 = D12';
D22 = pdist2(Y,Y,'euclidean');

D=[D11 D12;
   D21 D22];

lossMtx.D01=D.^2;


% OLD SLOW METHOD
% This new code replaces old slow code WS_distancemat.m in https://pages.stat.wisc.edu/~mchung/dynamicTDA/
% It requres converting matrix into cell-array format
% g1=cell(nGroup_i,1);
% g2=cell(nGroup_j,1);
% for i=1:nGroup_i
%     g1{i}=con_i(:,:,i);
% end
% 
% for j=1:nGroup_j
%    g2{j}=con_j(:,:,j);
% end
% 
% tic
% lossMtx = WS_distancemat(g1, g2);
% figure; imagesc(lossMtx); colorbar
% toc
% 20.050543 seconds for 20 vs. 30. 





