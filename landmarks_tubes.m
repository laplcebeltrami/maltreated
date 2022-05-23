function M = landmarks_tubes(M, vertices, threshold)
%function M = landmarks_tubes(M, vertices)
%
% M:             connectivity matrix. It has to be postive.
% vertices:    size 3 x p containging the coordinates of landmarks
% threshold: threshold
%
% (C) 2013 Moo K. Chung, mkchung@wisc.edu
%  Department of Biostatisics and Medical Informatics
%  University of Wisconsin, Madison
%
%
% Version 1.0 Febuary 2, 2013, created
% Version 1.1 May 9, 2013, nodesize, nodecolor added.

M=M;
n=size(vertices,1);

col=colormap(jet);

coln=size(col,1);

%N=M-max(max(M));

maxM=max(max(M));
minM=min(min(M));

for i=1:size(vertices,1)
    for j=1:size(vertices,1)
        if abs(M(i,j))>threshold
            hold on;
            
            p=vertices(i,:);
            q=vertices(j,:);
            tract =[p; q];
            tract_cell={[tract]};
            thickness= M(i,j)/100;
            if thickness < 2
                thickness=2;
            end;
    
            h=streamtube(tract_cell,thickness);
            %colind = round(coln*M(i,j)/maxM-1)+1;
            colind= round(coln*(M(i,j)-minM)/(maxM-minM)-1)+1;
           
            if colind>coln
                colind=coln;
            else
                if colind <2
                    colind=2;
                end;
            end;
            
            set(h,'EdgeColor','none','FaceColor',col(colind,:), 'CDataMapping','direct','AmbientStrength',1); 
            
        end;
    end;
    
end;

 daspect([0.5 0.5 0.5]);
 
 caxis([minM maxM])
 %colorbar
 
 