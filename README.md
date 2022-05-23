Matlab binary file jacobian.mat contains various network data used in 

Chung, M.K., Hanson, J.L., Ye, J., Davidson, R.J. Pollak, S.D. 2015 Persistent homology in sparse regression and its application to brain morphometry. IEEE Transactions on Medical Imaging, 34:1928-1939 http://pages.stat.wisc.edu/~mchung/papers/chung.2015.TMI.pdf

Chung, M.K., Hanson, J.L., Lee, H., Adluru, N., Alexander1, A.L., Davidson, A.L., Pollak, S.D. 2013. Persistent homological sparse network approach to detecting white matter abnormality in maltreated children: MRI and DTI multimodal study, 16th International Conference on Medical Image Computing and Computer Assisted Intervention (MICCAI).  Lecture Notes in Computer Science (LNCS) 8149:300-307 
https://pages.stat.wisc.edu/~mchung/papers/chung.2013.MICCAI.pdf

It contains the following variables.

jacobian: 54 (# of subject) x 18881 (# of vertices) matrix of Jacobian determinants obtained from MRI
FA         : 54 (# of subject) x 18881 (# of vertices) matrix of fractional anisotropy (FA) obtained from DTI. 
surf       : White matter surface template in MATLAB surface mesh format with 18881 mesh vertices 
nodes    : 548 Node positions uniformly subsampled from 18881 mesh vertices.
age        : Ages of subjects in year 
group    : Categorical variable indicating if a subject is normal (0) or post institutionalized (PI) children 1. 
               There are total 31 normal controls and 23 PI.
gender   : Categorical variable indicating if a subject is female (0) or male 1 

Variable jacobian is the Jacobian determinant of deforming a white matter template to 54 individual surfaces. It is sampled at 18881 mesh vertices. Variable FA is fractional anisotropy obtained from DTI. In this page, we will use jacobian to demonstrate various parts of the codes. But the method can be easily applicable to FA as well. 

load jacobian.mat
ind=mesh_commonvertex(surf, nodes);
surfJJ= jacobian(:,ind);

18881 nodes are too large to handle so we subsample the Jacobian determinant at 18881 nodes to 548 nodes using mesh_commonvertex.m, which basically finds the common mesh vertices in the surf mesh using nodes coordinates. This results in the variable surfJJ, which is 54 (# of subjects) x 548 (# of nodes) matrix. We separate the data into two groups indicated by  _pi (maltreated) and _co (controls). Then Pearson correlation across nodes are computed as

X=surfJJ(find(group),:);
corr_pi= corrcoef(X);

X=surfJJ(find(~group),:);
corr_co= corrcoef(X);

The correlation matrices of PI and controls are then computed as corr_pi and corr_co respectively. The size of the correlation matrices are 548 x 548 and this is expected to be symmetric but may not be positive definite.   The sparse network model in [1] and [2] can be used to make the correlation matrices positive definite. The entries of the correlation matrices give the edge wights in the network model.

To display the networks in 3D, we need the outline of the brain, which is obtained from the template. The white matter surface template is constructed by thresholding the fractional anisotropy (FA) values of the template and stored as variable surf.

figure;
figure_patch(surf, [0.3 0.3 0.3],0.2); 

On top of the brain surface, we display 548 network nodes as 3D spheres using 
landmarks_nodelabel:

coord = nodes.vertices; 
nodevalue = sum(corr_co,1); 
landmarks_nodelabel(coord, 3, nodevalue,[])
view([90 90]); camlight;
 
Subsequently, the stremtube representation is used to display the edges between nodes as 3D tubes. 
