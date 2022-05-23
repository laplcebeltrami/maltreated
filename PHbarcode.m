function lambda = PHbarcode(C)
% function lambda = PHbarcode(C)
% 
% The function computes the sequence of filtration values lambda out of a given 
% connectivity matrix C using the Kruskal's algorithm for determining 
% the minimum spanning tree.
%
% (C) 2012 Moo K. Chung
% mkchung@wisc.edu
% Department of Biostatistics and Medical Informatics
% University of Wisconsin-Madison
%
% Update: March 20, 2012


G=sparse(C);
[Tree, pred] = graphminspantree(G, 'Method', 'Kruskal');

p=size(C,1);
d=[];
for i=1:p
    for j=1:p
        if Tree(i,j)~=0
            d=[d Tree(i,j)];
        end
    end;
end
lambda=sort(d); 