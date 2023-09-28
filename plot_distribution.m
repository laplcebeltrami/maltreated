function plot_distribution(stat_s, bins, observation)
%function plot_distribution(stat_s, bins, observation)
%
% INPUT
%    bins: number of bins
%
% The code is part of PH-STAT (Statitical Inference on Persistent Homology) package
% and downloaded from https://github.com/laplcebeltrami/PH-STAT
%
% (C) 2022 D. Vijay Anand, Moo K. Chung
%          mkchung@wisc.edu 
%     University of Wisconsin-Madison
%
% Update history
%   2022 created Anand & Chung

[rows, cols] = size(stat_s);
% Check if it's a row or column vector
if rows == 1
    stat_s = stat_s';
end

histogram(stat_s,'FaceColor',[0.7 0.7 0.7],'Normalization', 'probability',...
    'NumBins',bins);
if ~isempty(observation)
    hold on
    plot([observation observation],[0 1],'--r','linewidth',2);
end

%xlabel('Test Statistic')
%ylabel('Null distribution')
set(gcf, 'Position', [400 400 600 250])
set(gca, 'fontsize',16) 

 whitebg(gcf,'w');
 set(gcf,'Color','w','InvertHardcopy','off');
 


