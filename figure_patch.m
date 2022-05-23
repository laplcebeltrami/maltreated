function figure_patch(surf,color,c);
%
% figure_patch(surf,color,c);
%
% surf : surf mesh
% color: surface color
% c    : amount of transparency
%
% (c) Moo K. Chung
% University of Wisconsin-Madison
% mkchung@wisc.edu
%
%
% update history: April 1, 2010


%surf= reducepatch(surf,0.2); % it reduces the patch size

p=patch(surf)
set(p,'FaceColor',color,'EdgeColor','none');


daspect([1 1 1])
view(3); 
axis tight; axis vis3d off;
 

lighting gouraud
material shiny;
%camlight

alpha(c)

%axis off
set(gcf,'Color','w') 

%background='white'; whitebg(gcf,background);
%set(gcf,'Color',background,'InvertHardcopy','off');





