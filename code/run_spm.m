% Script for reslicing ROIs

clear; close all;

addpath /ZPOOL/data/tools/spm12/;
savepath;

spm fmri

%RewardVlpfcRun1 = import('/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-189/cardgame/_reward_vlpfc.txt');
%RewardVlpfcRun1(:,1)