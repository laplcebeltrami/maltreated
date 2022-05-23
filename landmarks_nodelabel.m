function landmarks_nodelabel(vertices, nodesize, nodevalue, nodelabel)
% function landmarks_nodelabel(vertices, nodecolor, nodelabel)
% 
%The function displays graph/network nodes as 3D spheres. 
% 
% vertices      : node coordinates
% nodesize    : size of nodes. It should be determined empherically. 
% nodelabel   : node labels.
%
% 
% (c) 2013 Moo K. Chung 
%     mkchung@wisc.edu
%     Waisman Laboratory for Brain Imaging and Behavior
%     University of Wisconsin-Madison
%     
%
% Version 1.0 Febuary 2, 2013, created
% Version 1.1 May 9, 2013, nodesize, nodecolor added.

hold on;

n=size(vertices,1);
% node color: red [1 0 0]
%C= ones(n,1)*[0.6 0.6 0.5] 

% map nodeavlues to colormap

col=colormap(jet);
coln=size(col,1);
maxM=max(nodevalue);
minM=min(nodevalue);
colind= round(coln*(nodevalue-minM)/(maxM-minM)-1)+1;
colind(colind>coln)=coln;
colind(colind<1)=1;


scatter3sph(vertices(:,1),vertices(:,2),vertices(:,3), 'size', nodesize*ones(n,1), 'color', col(colind,:))
%scatter3(vertices(:,1),vertices(:,2),vertices(:,3), 50*ones(n,1), C, 'filled')

if ~isempty(nodelabel)
    %text(vertices(:,1)+1,vertices(:,2)+1,vertices(:,3)+1,nodelabel,'Color','k') %, 'BackgroundColor','w')
    text(vertices(:,1),vertices(:,2),vertices(:,3),nodelabel,'Color','k') %, 'BackgroundColor','w')
end;

axis square
set(gcf,'Color','w') 