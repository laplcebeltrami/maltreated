% (C) 2013 Moo K. Chung mkchung@wisc.edu
% Universtiy of Wisconsin-Madison
% 
% The files are downloaded from http://brainimaging.waisman.wisc.edu/~chung/barcodes/
% The manual for the codes below is given in the above weblink. 

%==============================
%1. DATA
%The data that was used to publish Chung, M.K., Hanson, J.L., Ye, J., Davidson, R.J. Pollak, 
%S.D. 2015 Persistent homology in sparse regression and its application to brain morphometry. 
%IEEE Transactions on Medical Imaging, 34:1928-1939 is stored in jacobian.mat


load jacobian.mat

% jacobian.mat file contains 
% jacobian  :Jacobian determinant of deforming a template to 54 individual 
%            surfaces. It is sampled at 18881 mesh vertices along the white matter
%            surface.
% surf      :White matter surface template saved as a structured array of
%            size
%                   faces: [37910×3 double]
%                vertices: [18881×3 double].
% nodes:    :548 node uniformly subsampled from 18881 mesh vertices. This
%            is used for smaller networks.
% nodes1856 :1856 node positions uniformly subsampled from 18881 mesh vertices
% group     :control 0, post instutitualized (PI) 1
% gender    :female 0, male 1
% FA        :54 (subjects) x 548 (nodes) matrix containing Fractional Anisotropy (FA)


ind=mesh_commonvertex(surf, nodes); 
surfJJ= jacobian(:,ind);
% 18881 nodes are too large to handle for computation intensive resampling
% techniques. Thus, we subsample the Jacobian determiannt to 548 nodes
% using mesh_commonvertex.m
% For the results on 1856 nodes, replace "nodes" with "nodes1856".


% surfJJ is 54 (subjects) x 548 (nodes) matrix containing Jacobian determinant. 

X=surfJJ(find(group),:); %X is size 23x548
corr_pi= corrcoef(X);
% corr_pi : correlation matrix of PI

X=surfJJ(find(~group),:);
corr_co= corrcoef(X);
% corr_co: correlation matrix of control


%================================
% 2. NETWORK DISPLAY
%The code was used to publish 3D nework visualizaion in Chung, M.K., Hanson, J.L., Ye, J., Davidson, 
%R.J. Pollak, S.D. 2015 Persistent homology in sparse regression and its application to brain morphometry. 
%IEEE Transactions on Medical Imaging, 34:1928-1939 and many other
%subsequent publicataions. 

% display surface template
figure;
figure_patch(surf, [0.6 0.6 0.6],0.2); 

%display nodes. 
coord = nodes.vertices;
nodevalue = sum(corr_co,1); % we wil simply put sum of correlation values at each node as an illustration
landmarks_nodelabel(coord, 3, nodevalue,[])
view([90 90]); camlight;

% display network edges
landmarks_tubes(corr_co, coord, 0.7); colorbar
view([90 90]); camlight;



%===============================
% 3. BETTI PLOTS
%The Betti plots are introduced in Chung, M.K., Hanson, J.L., Ye, J., Davidson, R.J. Pollak, 
%S.D. 2015 Persistent homology in sparse regression and its application to brain morphometry. 
%IEEE Transactions on Medical Imaging, 34:1928-1939


% Constructing network filtration on 1-correlation. 
% number of nodes
p=size(nodes.vertices,1)

figure;

dco=PHbarcode(1-corr_co);
plot([1; 1-dco'],  [p:-1:1], '-k');

dpi=PHbarcode(1-corr_pi);
hold on; plot([1; 1-dpi'],  [p:-1:1], '--r');

legend('Controls', 'PI')


%==========================
% 5. JACKKNIFE RESAMPLING ON BARCODES
%The Jackknife resampling was introduced in Chung, M.K., Hanson, J.L., Ye, J., Davidson, R.J. Pollak, 
%S.D. 2015 Persistent homology in sparse regression and its application to brain morphometry. 
%IEEE Transactions on Medical Imaging, 34:1928-1939

%n_subject=54

n1=  23;  
n2= 31; 

MSTpi=zeros(547,n1);
MSTco=zeros(547,n2);

X=surfJJ(find(group),:);
for i=1:n1
    Xi= X; 
    Xi(i,:)=[]; %i-th subject removed
    corr_pi= corrcoef(Xi);
    MSTpi(:,i) = PHbarcode(1-abs(corr_pi));
end;

Y=surfJJ(find(~group),:);
for i=1:n2
    Yi= Y; 
    Yi(i,:)=[]; %i-th subject removed
    corr_co= corrcoef(Yi);
    MSTco(:,i) = PHbarcode(1-abs(corr_co));
end;

%==========================
% 6. UNIFORM RESAMPLING ON BARCODES VIA LINEAR INTERPOLATION
%The technique is useufl if we want to sample at the uniform filtration
%values across subjects. However, this is engineering adhoc procedure and
%there is a better mathematical solution. Not yet implmented.

% EXAMPLE:
dco=PHbarcode(1-corr_co);
x=[1 1-dco]'; 
Y=[548:-1:1]';
figure; plot(x,Y, '.k');

xgrid=[0:0.005:1]'; 
ygrid = interp1(x,Y,xgrid, 'nearest'); 
hold on; plot(xgrid, ygrid, '+r')
legend('barcode', 'interpolation')

% uniform resampling on whole dataset
figure
INTpi=[]
INTco=[]
xgrid=[0:0.005:1]';
Y=[548:-1:1]';

for i=1:n1
    dco=MSTpi(:,i)';
    x=[1 1-dco];
    INTpi(:,i) = interp1(x,Y,xgrid, 'nearest');
    hold on; plot(xgrid, INTpi(:,i) ,'--r')
end

for i=1:n2
    dco=MSTco(:,i)';
    x=[1 1-dco];
    INTco(:,i) = interp1(x,Y,xgrid, 'nearest');
    hold on; plot(xgrid, INTco(:,i),'k')
end

figure_bg('w'); box on; print_tif('jackknife-resample')


%7. KS-TEST LIKE PROCEDURE
% between-group difference
d=[];
for i=1:n1
    for j=1:n2
        Mpi=INTpi(:,i);
        Mco=INTco(:,j);
        diff=max(abs(Mpi-Mco));
        d=[d diff];
    end
end;

% within-group difference
e=[];
for i=1:n1
    for j=1:n1
        Mpi1=INTpi(:,i);
        Mpi2=INTpi(:,j);
        
        diff=max(abs(Mpi1-Mpi2));
        if i~=j
            e=[e diff];
        end;
    end
end;

for i=1:n2
    for j=1:n2
        Mco1=INTco(:,i);
        Mco2=INTco(:,j);
        
        diff=max(abs(Mco1-Mco2));
        if i~=j
            e=[e diff];
        end;
    end
end;

figure; hist(e,30)
hold on; hist(d, 30)

[h p ci stat] = ttest2(d,e)


figure_bg('w')
print_tif('jackknife_bar')



