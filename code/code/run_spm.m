% Script for reslicing ROIs

clear; close all;

addpath /ZPOOL/data/tools/spm12/;
savepath;

spm fmri
%% 


%RewardVlpfcRun1 = import('/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-189/cardgame/_reward_vlpfc.txt');
%RewardVlpfcRun1(:,1)

% R=readtable("/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-189/sub-189_task-cardgame_run-1_desc-fslConfounds.tsv", "FileType","text","Delimiter","\t");
% for i=1:size(R(1,:),2)
%     R.Properties.VariableNames(i) = "R"+i;
% end
% R=table2array(R);
% save("sub189_run1_confounds.mat", "R");
% clear
% 
% R=readtable("/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-189/sub-189_task-cardgame_run-2_desc-fslConfounds.tsv", "FileType","text","Delimiter","\t");
% for i=1:size(R(1,:),2)
%     R.Properties.VariableNames(i) = "R"+i;
% end
% R=table2array(R);
% save("sub189_run2_confounds.mat", "R");
% clear
% 
% R=readtable("/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-189/sub-189_task-cardgame_run-3_desc-fslConfounds.tsv", "FileType","text","Delimiter","\t");
% for i=1:size(R(1,:),2)
%     R.Properties.VariableNames(i) = "R"+i;
% end
% R=table2array(R);
% save("sub189_run3_confounds.mat", "R");
% clear