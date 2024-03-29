# Structural Covariance and Connectivity in Maltreated Children 

Simply run MATLAB live editor file SCRIPT-NetworkNeuroScience.mlx

The structural connectivity data (connectivity-DTIcounts.mat) is explained in

[1] Chung, M.K., Hanson, J.L., Adluru, Aleander, A.L., Davidson, R.J., Pollak, S.D. 2017 
Integrative structural brain network analysis in diffusion tensor imaging, Brain Connectivity 7:331-346
https://pages.stat.wisc.edu/~mchung/papers/chung.2017.connectivity.pdf





Matlab binary file jacobian.mat contains various structural covariance network data used in 

[2] Chung, M.K., Hanson, J.L., Ye, J., Davidson, R.J. Pollak, S.D. 2015 Persistent homology in sparse regression and its application to brain morphometry. IEEE Transactions on Medical Imaging, 34:1928-1939 http://pages.stat.wisc.edu/~mchung/papers/chung.2015.TMI.pdf

[3] Chung, M.K., Hanson, J.L., Lee, H., Adluru, N., Alexander1, A.L., Davidson, A.L., Pollak, S.D. 2013. Persistent homological sparse network approach to detecting white matter abnormality in maltreated children: MRI and DTI multimodal study, 16th International Conference on Medical Image Computing and Computer Assisted Intervention (MICCAI).  Lecture Notes in Computer Science (LNCS) 8149:300-307 
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

Variable jacobian is the Jacobian determinant of deforming a white matter template to 54 individual surfaces. It is sampled at 18881 mesh vertices. Variable FA is fractional anisotropy obtained from DTI. Simply run script jacobian.m. The detailed information about the data is also given in
http://brainimaging.waisman.wisc.edu/%7Echung/barcodes



(C) 2013- Moo K. Chung, Jamie Hanson, Andrew Alexander, Richard Davidson, Seth Pollack, 
University of Wisconsin-Madison

