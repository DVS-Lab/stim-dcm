% Script for reslicing ROIs

clear; close all;

addpath /ZPOOL/data/tools/spm12/;
savepath;

spm fmri

%RewardVlpfcRun1 = import('/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-189/cardgame/_reward_vlpfc.txt');
%RewardVlpfcRun1(:,1)

sub189_run1=readtable("/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-189/sub-189_task-cardgame_run-1_desc-fslConfounds.tsv", "FileType","text","Delimiter","\t");
for i=1:size(sub189_run1(1,:),2)
    sub189_run1.Properties.VariableNames(i) = "R"+i;
end
save("sub189_run1_confounds.mat", "sub189_run1");

sub189_run2=readtable("/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-189/sub-189_task-cardgame_run-2_desc-fslConfounds.tsv", "FileType","text","Delimiter","\t");
for i=1:size(sub189_run2(1,:),2)
    sub189_run2.Properties.VariableNames(i) = "R"+i;
end
save("sub189_run2_confounds.mat", "sub189_run2");

sub189_run3=readtable("/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-189/sub-189_task-cardgame_run-3_desc-fslConfounds.tsv", "FileType","text","Delimiter","\t");
for i=1:size(sub189_run3(1,:),2)
    sub189_run3.Properties.VariableNames(i) = "R"+i;
end
save("sub189_run3_confounds.mat", "sub189_run3");