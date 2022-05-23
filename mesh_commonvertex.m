function ind = mesh_commonvertex(f, g)
%function ind = mesh_commonvertex(f, g)
%
% 
% mesh_commonvertex.m finds the index of f.vertices that is in g.vertices
% f should be larger mesh than g. 
%
% (C) 2013 Moo K. Chung mkchung@wisc.edu
% Universtiy of Wisconsin-Madison
% The files are downloaded from http://brainimaging.waisman.wisc.edu/~chung/barcodes/
%
% update history: 
% created April 1, 2012
% manaul  April 29, 2019


coordf=f.vertices;
coordg=g.vertices;

n=size(coordf,1);
m=size(coordg,1);

ind=zeros(m,1);

for i=1:m
    p=coordg(i,:);
    repp=repmat(p,n,1);
    diff=sqrt(sum((repp-coordf).^2,2));
    [c, minind] =min(diff);
    ind(i)=minind;
end;