function d = WS_distributions(lossMtx, nGroup1, nGroup2)
%function d = WS_istributions(lossMtx, nGroup1, nGroup2)   
%
% Compute the bwetween-group and within-group distances based on the
% topological distance explained in 
%
% [1] Songdechakraiwut, T., Shen, L., Chung, M.K. 2021 Topological learning and 
% its application to multimodal brain network integration, Medical Image 
% Computing and Computer Assisted Intervention (MICCAI), LNCS 12902:166-176 
%
% [2] Songdechakraiwut, T. Chung, M.K. 2023 Topological learning for brain networks, 
% Annals of Applied Statistics 17:403-433, arXiv:2012.00675.
% https://arxiv.org/pdf/2012.00675.pdf
%
%
% INPUT
% lossMtx          : matrix whose entries are pair-wise losses/distances
% nGroup1, nGroup2 : sample size in each group
%
%
% OUTPUT
%     d :  vector of all pairwise distances
%
% If you are using any part of the code, please reference the above paper.
%
% The code is part of PH-STAT (Statitical Inference on Persistent Homology) package
% and downloaded from https://github.com/laplcebeltrami/PH-STAT
%
% (C) 2023 Moo K. Chung 
%          email: mkchung@wisc.edu
%          University of Wisconsin-Madison
%
% Update history
%     2023 September 19 created



% within groups

within = [];
% sum of pair-wise distances within groups
for i = 1:nGroup1 % group 1
    for j = i + 1:nGroup1
        within = [within  lossMtx(i, j)];
    end
end

for i = nGroup1 + 1:nGroup1 + nGroup2 % group 2
    for j = i + 1:nGroup1 + nGroup2
        within = [within  lossMtx(i, j)];
    end
end

% between groups
% sum of pair-wise distances between the groups.

between = [];
for i = 1:nGroup1
    for j = nGroup1 + 1:nGroup1 + nGroup2
        between = [between lossMtx(i, j)];
    end
end

d.between = between;
d.within = within;


end



