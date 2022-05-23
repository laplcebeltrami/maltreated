
load jacobian.mat

% jacobian.mat file contains 
% jacobian       :Jacobian determinant of deforming a template to 54 individual surfaces
%                       It is sampled at 18881 mesh vertices
% surf               :White matter surface template
% nodes:          : 548 node positions uniformly subsampled from 18881 mesh vertices
% nodes1856   :1856 node positions uniformly subsampled from 18881 mesh vertices
% group     : control 0, post instutitualized (PI) 1
% gender   : female 0, male 1

ind=mesh_commonvertex(surf, nodes);
surfJJ= jacobian(:,ind);
% 18881 nodes are too large to handle so we subsample the Jacobian determiannt to 548 nodes.
% For the results on 1856 nodes, replace "nodes" with "nodes1856".
% surfJJ is 54 (subjects) x 548 (nodes) matrix containing Jacobian determinant. 
% FA is 54 (subjects) x 548 (nodes) matrix containing Fractional Anisotropy (FA)

X=surfJJ(find(group),:);
corr_pi= corrcoef(X);
% corr_pi : correlation matrix of PI

X=surfJJ(find(~group),:);
corr_co= corrcoef(X);
% corr_co: correlation matrix of control


% 2. NETWORK DISPLAY
% display surface template
figure;
figure_patch(surf, [0.7 0.9 0.9] ,0.2); 
%figure_patch(surf, 'b',0.2); 


%display nodes. 
coord = nodes.vertices;
nodevalue = sum(corr_co,1)-10; % we wil simply put sum of correlation values at each node as an illustration
landmarks_nodelabel(coord, 3, nodevalue,[])
view([90 90]); camlight;

% display network edges
landmarks_tubes(corr_co, coord, 0.7);
view([90 90]); camlight;
camlight
material metal