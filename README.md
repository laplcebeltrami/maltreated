# Structural Covariance and Connectivity in Maltreated Children 

The data and codes are published in 

M.K. Chung, T. Azizi, J. Hanson, A. Alexander, R.J. Davidson, and S. Pollak. [Altered topological structure of the brain white matter in maltreated children through topological data analysis](https://watermark.silverchair.com/netn_a_00355.pdf?token=AQECAHi208BE49Ooan9kkhW_Ercy7Dm3ZL_9Cf3qfKAc485ysgAAAzUwggMxBgkqhkiG9w0BBwagggMiMIIDHgIBADCCAxcGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMFVtrCIkgi-QYFnToAgEQgIIC6Nq6eySCKWxqnkRlwmhzmRf5ncVcpivocwPJqOjBivwAg3B9J72BNIgkVuzGJnywc95ogUVasvn-uCSgJJD68_HWflcn5BDTXbw8678Ka4MgWzULUx9xsJOxOSIwbzLdSlKL4br0zbim3KpbqcRLmtz_8LgiLXTfbQSF2_BQgTRCd7Ff2mMBxxhI5sjEW0L75GtzqX2gVAzQh0aRrtesH-9oIvXg3jXocqW-4j5lNa9kSvG7ZPRwJBXdCb4dhvDZLAL8bRfKnw5gTg2MdxylcVQJ0HWaKb266KByBrGKK2iNka1qKCUotGbC8yt9s335LqDEREoMlfCjlL9-gq0l47rMRv1lwHoppCRooTAjzDQWyfA6ZQpo26JkZaRXbfF_V0t9fr2-Flr6936LxBr_AfUkLNY_pez7u43JeouBu1sGwF0-ugP0jGt_1F00pd94cBqGfSCkVjHynACvlZqn2kii1N1V5GZEc7wuO3C7cfcvj6yrlJVgAjAX-WOowdF6cDClzvZkmhaOu5NJLKbXMR2z_uUp5m1SrET7IMn_u02W2XPM7GQ7r_vZPXg9pHSgPCD1DRoJ7xf5mtNq4ZD-JiW0ynlODX8TnDA_xtYclN4C5bR1sTOJ2SOhOwL9Wf3bhAHhUJrNkXvIjFUj0Bi8pExPuiZzkVsUhSKoWuyVBFkUlP7XArHbOBiGfj8BMH1wz2zaS3uG7xAwHth945KqevZKyU4MGi1j8MAQtAxUVJ8zv71tHfwchdYU2KeX32RjQfUb7ED-nOhIteLaHnibWRuoUZpNn1jqfMnqHOkVgy7D0PC0k8Bpy_2PNulqvj75zAACsSBKwyOPBm70i3hsdjHrHyibEkUlztoRIbNrB1YqtxGSEDARPY7KKsBG_uXc__vGbSmODQSaw9e6m933tmg0oV2KeONYUISp5H5oSGaZjnOoZBUKTX0EfTkA5Lfs4FY7pXTNruykcxEK7hQPDAlqdGvwM8gi-Q). Network Neuroscience, 2024, 8:355-376. 


Simply run MATLAB live editor file SCRIPT-NetworkNeuroScience.mlx

The structural connectivity data (connectivity-DTIcounts.mat) is further explained in

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

The project is funded in part by NIH MH133614.

