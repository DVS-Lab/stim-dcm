clear all; clc
%% Script for running individual level stats across subs in SPM
% Changes that need to be made:
%   -Replace sub IDs with var
%   -Replace EV onsets & durations with var
%   -Question: can batch & contrasts be in the same script? Need to find
%   out



%% Code for stats:
% nums = string([189,207:1:238]);
nums = "207";
file_nums_for_subjects = string(zeros(size(length(nums))));
for jj=1:length(nums)
    savedir = '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-'+nums(jj)+'/1stlevel_withConfounds';
    [status, msg, msgID] = mkdir(savedir);
    if status~=1
        mkdir(savedir);
    end
end
for jj=1:length(nums)
    matlabbatch{1}.spm.stats.fmri_spec.dir = cellstr({savedir});
    matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
    matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 2;
    matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
    matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
    %%
    dir_to_check_1 = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-"+nums(jj);
    fol_name_1 = "run-1";
    folderfull_1 = fullfile(dir_to_check_1, fol_name_1);
    if exist(folderfull_1, 'dir')
        foldercontent_1 = dir(folderfull_1);
        if numel(foldercontent_1)>3
             matlabbatch{1}.spm.stats.fmri_spec.sess(1).scans = cellstr({
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0000.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0001.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0002.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0003.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0004.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0005.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0006.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0007.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0008.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0009.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0010.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0011.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0012.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0013.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0014.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0015.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0016.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0017.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0018.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0019.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0020.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0021.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0022.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0023.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0024.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0025.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0026.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0027.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0028.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0029.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0030.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0031.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0032.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0033.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0034.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0035.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0036.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0037.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0038.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0039.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0040.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0041.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0042.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0043.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0044.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0045.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0046.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0047.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0048.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0049.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0050.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0051.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0052.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0053.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0054.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0055.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0056.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0057.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0058.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0059.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0060.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0061.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0062.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0063.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0064.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0065.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0066.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0067.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0068.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0069.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0070.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0071.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0072.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0073.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0074.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0075.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0076.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0077.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0078.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0079.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0080.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0081.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0082.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0083.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0084.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0085.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0086.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0087.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0088.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0089.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0090.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0091.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0092.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0093.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0094.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0095.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0096.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0097.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0098.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0099.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0100.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0101.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0102.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0103.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0104.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0105.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0106.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0107.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0108.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0109.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0110.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0111.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0112.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0113.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0114.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0115.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0116.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0117.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0118.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0119.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0120.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0121.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0122.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0123.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0124.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0125.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0126.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0127.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0128.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0129.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0130.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0131.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0132.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0133.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0134.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0135.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0136.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0137.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0138.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0139.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0140.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0141.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0142.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0143.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0144.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0145.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0146.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0147.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0148.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0149.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0150.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0151.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0152.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0153.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0154.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0155.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0156.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0157.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0158.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0159.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0160.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0161.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0162.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0163.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0164.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0165.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0166.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0167.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0168.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0169.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0170.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0171.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0172.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0173.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0174.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0175.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0176.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0177.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0178.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0179.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0180.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0181.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0182.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0183.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0184.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0185.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0186.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0187.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0188.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0189.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0190.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0191.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0192.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0193.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0194.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0195.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0196.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0197.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0198.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0199.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0200.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0201.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0202.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0203.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0204.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0205.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0206.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0207.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0208.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0209.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0210.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0211.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0212.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0213.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0214.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0215.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0216.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0217.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0218.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0219.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0220.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0221.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0222.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0223.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0224.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0225.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0226.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0227.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0228.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0229.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0230.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0231.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0232.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0233.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0234.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0235.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0236.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0237.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0238.nii,1'
                                                        '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0239.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0240.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0241.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0242.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0243.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0244.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0245.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0246.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0247.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0248.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0249.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0250.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0251.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0252.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0253.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0254.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0255.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0256.nii,1'
                                                        % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-1_vol0257.nii,1'
                                                        });
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).name = '_punish_rtpj';
                p_rtpj = '_punish_rtpj';
                %%
                filepath_p_rtpj = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-"+nums(jj)+"/cardgame/run-1/"+p_rtpj;
                %% Set up the Import Options and import the data
                opts = delimitedTextImportOptions("NumVariables", 3);
            
                % Specify range and delimiter
                opts.Delimiter = "\t";
                
                % Specify column names and types
                opts.VariableNames = ["VarName1", "VarName2", "VarName3"];
                opts.VariableTypes = ["double", "double", "double"];
                % Specify file level properties
                opts.ExtraColumnsRule = "ignore";
                opts.EmptyLineRule = "read";
                file_to_read_p_rtpj = readtable(filepath_p_rtpj,opts);
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).onset = table2array(file_to_read_p_rtpj(:,1));
                %%
                %%
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).duration = table2array(file_to_read_p_rtpj(:,2));
                %%
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).tmod = 0;
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(1).orth = 1;
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).name = '_reward_rtpj';
                %%
                r_rtpj = '_reward_rtpj';
                %%
                filepath_r_rtpj = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-"+nums(jj)+"/cardgame/run-1/"+r_rtpj;
                %% Set up the Import Options and import the data
                opts = delimitedTextImportOptions("NumVariables", 3);
            
                % Specify range and delimiter
                opts.Delimiter = "\t";
                
                % Specify column names and types
                opts.VariableNames = ["VarName1", "VarName2", "VarName3"];
                opts.VariableTypes = ["double", "double", "double"];
                % Specify file level properties
                opts.ExtraColumnsRule = "ignore";
                opts.EmptyLineRule = "read";
                file_to_read_r_rtpj = readtable(filepath_r_rtpj,opts);
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).onset = table2array(file_to_read_r_rtpj(:,1));
                %%
                %%
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).duration = table2array(file_to_read_r_rtpj(:,2));
                %%
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).tmod = 0;
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(2).orth = 1;
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(3).name = '_punish_vlpfc';
                p_vlpfc = '_punish_vlpfc';
                %%
                filepath_p_vlpfc = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-"+nums(jj)+"/cardgame/run-1/"+p_vlpfc;
                %% Set up the Import Options and import the data
                opts = delimitedTextImportOptions("NumVariables", 3);
            
                % Specify range and delimiter
                opts.Delimiter = "\t";
                
                % Specify column names and types
                opts.VariableNames = ["VarName1", "VarName2", "VarName3"];
                opts.VariableTypes = ["double", "double", "double"];
                % Specify file level properties
                opts.ExtraColumnsRule = "ignore";
                opts.EmptyLineRule = "read";
                file_to_read_p_vlpfc = readtable(filepath_p_vlpfc,opts);
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(3).onset = table2array(file_to_read_p_vlpfc(:,1));
                %%
                %%
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(3).duration = table2array(file_to_read_p_rtpj(:,2));
                %%
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(3).tmod = 0;
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(3).orth = 1;
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(4).name = '_reward_vlpfc';
                %%
                r_vlpfc = '_reward_vlpfc';
                %%
                filepath_r_vlpfc = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-"+nums(jj)+"/cardgame/run-1/"+r_vlpfc;
                %% Set up the Import Options and import the data
                opts = delimitedTextImportOptions("NumVariables", 3);
            
                % Specify range and delimiter
                opts.Delimiter = "\t";
                
                % Specify column names and types
                opts.VariableNames = ["VarName1", "VarName2", "VarName3"];
                opts.VariableTypes = ["double", "double", "double"];
                % Specify file level properties
                opts.ExtraColumnsRule = "ignore";
                opts.EmptyLineRule = "read";
                file_to_read_r_vlpfc = readtable(filepath_r_vlpfc,opts);
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(4).onset = table2array(file_to_read_r_vlpfc(:,1));
                %%
                %%
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(4).duration = table2array(file_to_read_r_rtpj(:,2));
                %%
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(4).tmod = 0;
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).cond(4).orth = 1;
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi = {''};
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).multi_reg = cellstr({'/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-'+nums(jj)+'/sub-'+nums(jj)+'_task-cardgame_run-1_desc-fslConfounds.mat'});
                matlabbatch{1}.spm.stats.fmri_spec.sess(1).hpf = 128;
        end 
    end 
    %%
    dir_to_check_2 = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-"+nums(jj);
    fol_name_2 = "run-2";
    folderfull_2 = fullfile(dir_to_check_2, fol_name_2);
    if exist(folderfull_2, 'dir')
        foldercontent_2 = dir(folderfull_2);
        if numel(foldercontent_2)>3
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).scans = cellstr({
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0000.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0001.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0002.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0003.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0004.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0005.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0006.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0007.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0008.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0009.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0010.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0011.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0012.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0013.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0014.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0015.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0016.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0017.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0018.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0019.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0020.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0021.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0022.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0023.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0024.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0025.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0026.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0027.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0028.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0029.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0030.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0031.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0032.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0033.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0034.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0035.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0036.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0037.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0038.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0039.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0040.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0041.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0042.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0043.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0044.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0045.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0046.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0047.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0048.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0049.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0050.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0051.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0052.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0053.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0054.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0055.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0056.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0057.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0058.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0059.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0060.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0061.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0062.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0063.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0064.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0065.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0066.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0067.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0068.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0069.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0070.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0071.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0072.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0073.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0074.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0075.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0076.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0077.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0078.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0079.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0080.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0081.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0082.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0083.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0084.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0085.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0086.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0087.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0088.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0089.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0090.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0091.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0092.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0093.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0094.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0095.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0096.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0097.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0098.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0099.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0100.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0101.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0102.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0103.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0104.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0105.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0106.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0107.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0108.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0109.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0110.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0111.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0112.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0113.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0114.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0115.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0116.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0117.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0118.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0119.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0120.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0121.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0122.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0123.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0124.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0125.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0126.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0127.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0128.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0129.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0130.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0131.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0132.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0133.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0134.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0135.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0136.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0137.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0138.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0139.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0140.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0141.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0142.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0143.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0144.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0145.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0146.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0147.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0148.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0149.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0150.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0151.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0152.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0153.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0154.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0155.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0156.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0157.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0158.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0159.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0160.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0161.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0162.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0163.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0164.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0165.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0166.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0167.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0168.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0169.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0170.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0171.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0172.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0173.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0174.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0175.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0176.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0177.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0178.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0179.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0180.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0181.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0182.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0183.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0184.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0185.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0186.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0187.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0188.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0189.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0190.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0191.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0192.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0193.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0194.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0195.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0196.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0197.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0198.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0199.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0200.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0201.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0202.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0203.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0204.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0205.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0206.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0207.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0208.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0209.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0210.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0211.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0212.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0213.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0214.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0215.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0216.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0217.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0218.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0219.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0220.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0221.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0222.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0223.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0224.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0225.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0226.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0227.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0228.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0229.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0230.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0231.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0232.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0233.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0234.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0235.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0236.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0237.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0238.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0239.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0240.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0241.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0242.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0243.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0244.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0245.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0246.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0247.nii,1'
                                                                % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0248.nii,1'
                                                                % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0249.nii,1'
                                                                % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0250.nii,1'
                                                                % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0251.nii,1'
                                                                % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0252.nii,1'
                                                                % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0253.nii,1'
                                                                % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0254.nii,1'
                                                                % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0255.nii,1'
                                                                % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0256.nii,1'
                                                                % '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-2_vol0257.nii,1'
                                                                });
                matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).name = '_punish_rtpj';
            p_rtpj = '_punish_rtpj';
            %%
            filepath_p_rtpj = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-"+nums(jj)+"/cardgame/run-2/"+p_rtpj;
            %% Set up the Import Options and import the data
            opts = delimitedTextImportOptions("NumVariables", 3);
        
            % Specify range and delimiter
            opts.Delimiter = "\t";
            
            % Specify column names and types
            opts.VariableNames = ["VarName1", "VarName2", "VarName3"];
            opts.VariableTypes = ["double", "double", "double"];
            % Specify file level properties
            opts.ExtraColumnsRule = "ignore";
            opts.EmptyLineRule = "read";
            file_to_read_p_rtpj = readtable(filepath_p_rtpj,opts);
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).onset = table2array(file_to_read_p_rtpj(:,1));
            %%
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).duration = table2array(file_to_read_p_rtpj(:,2));
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).tmod = 0;
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(1).orth = 1;
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).name = '_reward_rtpj';
            %%
            r_rtpj = '_reward_rtpj';
            %%
            filepath_r_rtpj = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-"+nums(jj)+"/cardgame/run-2/"+r_rtpj;
            %% Set up the Import Options and import the data
            opts = delimitedTextImportOptions("NumVariables", 3);
        
            % Specify range and delimiter
            opts.Delimiter = "\t";
            
            % Specify column names and types
            opts.VariableNames = ["VarName1", "VarName2", "VarName3"];
            opts.VariableTypes = ["double", "double", "double"];
            % Specify file level properties
            opts.ExtraColumnsRule = "ignore";
            opts.EmptyLineRule = "read";
            file_to_read_r_rtpj = readtable(filepath_r_rtpj,opts);
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).onset = table2array(file_to_read_r_rtpj(:,1));
            %%
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).duration = table2array(file_to_read_r_rtpj(:,2));
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).tmod = 0;
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(2).orth = 1;
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(3).name = '_punish_vlpfc';
            p_vlpfc = '_punish_vlpfc';
            %%
            filepath_p_vlpfc = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-"+nums(jj)+"/cardgame/run-2/"+p_vlpfc;
            %% Set up the Import Options and import the data
            opts = delimitedTextImportOptions("NumVariables", 3);
        
            % Specify range and delimiter
            opts.Delimiter = "\t";
            
            % Specify column names and types
            opts.VariableNames = ["VarName1", "VarName2", "VarName3"];
            opts.VariableTypes = ["double", "double", "double"];
            % Specify file level properties
            opts.ExtraColumnsRule = "ignore";
            opts.EmptyLineRule = "read";
            file_to_read_p_vlpfc = readtable(filepath_p_vlpfc,opts);
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(3).onset = table2array(file_to_read_p_vlpfc(:,1));
            %%
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(3).duration = table2array(file_to_read_p_rtpj(:,2));
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(3).tmod = 0;
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(3).orth = 1;
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(4).name = '_reward_vlpfc';
            %%
            r_vlpfc = '_reward_vlpfc';
            %%
            filepath_r_vlpfc = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-"+nums(jj)+"/cardgame/run-2/"+r_vlpfc;
            %% Set up the Import Options and import the data
            opts = delimitedTextImportOptions("NumVariables", 3);
        
            % Specify range and delimiter
            opts.Delimiter = "\t";
            
            % Specify column names and types
            opts.VariableNames = ["VarName1", "VarName2", "VarName3"];
            opts.VariableTypes = ["double", "double", "double"];
            % Specify file level properties
            opts.ExtraColumnsRule = "ignore";
            opts.EmptyLineRule = "read";
            file_to_read_r_vlpfc = readtable(filepath_r_vlpfc,opts);
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(4).onset = table2array(file_to_read_r_vlpfc(:,1));
            %%
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(4).duration = table2array(file_to_read_r_rtpj(:,2));
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(4).tmod = 0;
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).cond(4).orth = 1;
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi = {''};
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
            confounds_run2 = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-"+nums(jj)+'/sub-'+nums(jj)+"_task-cardgame_run-2_desc-fslConfounds.tsv";
            save_dir_run2 = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-"+nums(jj)+"/sub-"+nums(jj)+"_task-cardgame_run-2_desc-fslConfounds";
            tsvtom(confounds_run2, save_dir_run2);
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).multi_reg = cellstr({'/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-'+nums(jj)+'/sub-'+nums(jj)+'_task-cardgame_run-2_desc-fslConfounds.mat'});
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).hpf = 128;
        end
    end
            %%
    dir_to_check_3 = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-"+nums(jj);
    fol_name_3 = "run-3";
    folderfull_3 = fullfile(dir_to_check_3, fol_name_3);
    if exist(folderfull_3, 'dir')
        foldercontent_3 = dir(folderfull_3);
        if numel(foldercontent_3)>3
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).scans = cellstr({
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0000.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0001.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0002.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0003.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0004.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0005.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0006.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0007.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0008.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0009.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0010.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0011.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0012.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0013.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0014.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0015.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0016.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0017.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0018.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0019.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0020.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0021.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0022.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0023.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0024.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0025.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0026.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0027.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0028.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0029.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0030.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0031.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0032.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0033.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0034.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0035.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0036.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0037.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0038.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0039.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0040.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0041.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0042.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0043.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0044.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0045.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0046.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0047.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0048.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0049.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0050.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0051.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0052.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0053.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0054.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0055.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0056.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0057.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0058.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0059.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0060.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0061.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0062.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0063.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0064.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0065.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0066.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0067.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0068.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0069.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0070.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0071.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0072.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0073.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0074.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0075.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0076.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0077.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0078.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0079.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0080.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0081.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0082.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0083.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0084.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0085.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0086.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0087.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0088.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0089.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0090.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0091.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0092.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0093.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0094.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0095.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0096.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0097.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0098.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0099.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0100.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0101.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0102.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0103.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0104.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0105.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0106.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0107.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0108.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0109.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0110.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0111.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0112.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0113.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0114.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0115.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0116.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0117.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0118.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0119.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0120.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0121.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0122.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0123.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0124.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0125.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0126.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0127.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0128.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0129.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0130.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0131.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0132.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0133.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0134.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0135.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0136.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0137.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0138.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0139.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0140.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0141.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0142.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0143.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0144.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0145.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0146.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0147.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0148.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0149.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0150.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0151.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0152.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0153.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0154.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0155.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0156.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0157.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0158.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0159.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0160.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0161.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0162.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0163.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0164.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0165.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0166.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0167.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0168.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0169.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0170.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0171.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0172.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0173.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0174.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0175.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0176.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0177.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0178.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0179.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0180.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0181.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0182.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0183.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0184.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0185.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0186.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0187.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0188.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0189.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0190.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0191.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0192.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0193.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0194.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0195.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0196.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0197.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0198.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0199.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0200.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0201.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0202.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0203.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0204.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0205.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0206.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0207.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0208.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0209.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0210.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0211.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0212.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0213.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0214.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0215.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0216.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0217.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0218.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0219.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0220.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0221.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0222.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0223.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0224.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0225.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0226.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0227.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0228.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0229.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0230.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0231.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0232.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0233.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0234.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0235.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0236.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0237.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0238.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0239.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0240.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0241.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0242.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0243.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0244.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0245.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0246.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0247.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0248.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0249.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0250.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0251.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0252.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0253.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0254.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0255.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0256.nii,1'
                                                                '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/sub-'+nums(jj)+'_task-cardgame_run-3_vol0257.nii,1'
                                                                });
            %%
                matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).name = '_punish_rtpj';
            p_rtpj = '_punish_rtpj';
            %%
            filepath_p_rtpj = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-"+nums(jj)+"/cardgame/run-1/"+p_rtpj;
            %% Set up the Import Options and import the data
            opts = delimitedTextImportOptions("NumVariables", 3);
        
            % Specify range and delimiter
            opts.Delimiter = "\t";
            
            % Specify column names and types
            opts.VariableNames = ["VarName1", "VarName2", "VarName3"];
            opts.VariableTypes = ["double", "double", "double"];
            % Specify file level properties
            opts.ExtraColumnsRule = "ignore";
            opts.EmptyLineRule = "read";
            file_to_read_p_rtpj = readtable(filepath_p_rtpj,opts);
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).onset = table2array(file_to_read_p_rtpj(:,1));
            %%
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).duration = table2array(file_to_read_p_rtpj(:,2));
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).tmod = 0;
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(1).orth = 1;
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).name = '_reward_rtpj';
            %%
            r_rtpj = '_reward_rtpj';
            %%
            filepath_r_rtpj = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-"+nums(jj)+"/cardgame/run-3/"+r_rtpj;
            %% Set up the Import Options and import the data
            opts = delimitedTextImportOptions("NumVariables", 3);
        
            % Specify range and delimiter
            opts.Delimiter = "\t";
            
            % Specify column names and types
            opts.VariableNames = ["VarName1", "VarName2", "VarName3"];
            opts.VariableTypes = ["double", "double", "double"];
            % Specify file level properties
            opts.ExtraColumnsRule = "ignore";
            opts.EmptyLineRule = "read";
            file_to_read_r_rtpj = readtable(filepath_r_rtpj,opts);
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).onset = table2array(file_to_read_r_rtpj(:,1));
            %%
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).duration = table2array(file_to_read_r_rtpj(:,2));
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).tmod = 0;
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(2).orth = 1;
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(3).name = '_punish_vlpfc';
            p_vlpfc = '_punish_vlpfc';
            %%
            filepath_p_vlpfc = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-"+nums(jj)+"/cardgame/run-3/"+p_vlpfc;
            %% Set up the Import Options and import the data
            opts = delimitedTextImportOptions("NumVariables", 3);
        
            % Specify range and delimiter
            opts.Delimiter = "\t";
            
            % Specify column names and types
            opts.VariableNames = ["VarName1", "VarName2", "VarName3"];
            opts.VariableTypes = ["double", "double", "double"];
            % Specify file level properties
            opts.ExtraColumnsRule = "ignore";
            opts.EmptyLineRule = "read";
            file_to_read_p_vlpfc = readtable(filepath_p_vlpfc,opts);
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(3).onset = table2array(file_to_read_p_vlpfc(:,1));
            %%
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(3).duration = table2array(file_to_read_p_rtpj(:,2));
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(3).tmod = 0;
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(3).pmod = struct('name', {}, 'param', {}, 'poly', {});
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(3).orth = 1;
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(4).name = '_reward_vlpfc';
            %%
            r_vlpfc = '_reward_vlpfc';
            %%
            filepath_r_vlpfc = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/EVFiles/sub-"+nums(jj)+"/cardgame/run-3/"+r_vlpfc;
            %% Set up the Import Options and import the data
            opts = delimitedTextImportOptions("NumVariables", 3);
        
            % Specify range and delimiter
            opts.Delimiter = "\t";
            
            % Specify column names and types
            opts.VariableNames = ["VarName1", "VarName2", "VarName3"];
            opts.VariableTypes = ["double", "double", "double"];
            % Specify file level properties
            opts.ExtraColumnsRule = "ignore";
            opts.EmptyLineRule = "read";
            file_to_read_r_vlpfc = readtable(filepath_r_vlpfc,opts);
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(4).onset = table2array(file_to_read_r_vlpfc(:,1));
            %%
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(4).duration = table2array(file_to_read_r_rtpj(:,2));
            %%
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(4).tmod = 0;
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(4).pmod = struct('name', {}, 'param', {}, 'poly', {});
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).cond(4).orth = 1;
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).multi = {''};
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).regress = struct('name', {}, 'val', {});
            confounds_run3 = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-"+nums(jj)+'/sub-'+nums(jj)+"_task-cardgame_run-3_desc-fslConfounds.tsv";
            save_dir_run3 = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-"+nums(jj)+"/sub-"+nums(jj)+"_task-cardgame_run-3_desc-fslConfounds";
            tsvtom(confounds_run3, save_dir_run3);
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).multi_reg = cellstr({'/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-'+nums(jj)+'/sub-'+nums(jj)+'_task-cardgame_run-3_desc-fslConfounds.mat'});
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).hpf = 128;
        end
    end
    matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
    matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
    matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
    matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
    matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
    matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
    matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';
    %% model estimation
    matlabbatch{2}.spm.stats.fmri_est.spmmat = cellstr({'/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-'+nums(jj)+'/1stlevel_withConfounds/SPM.mat'});
    matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
    matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
    spm('defaults', 'FMRI');
    spm_jobman('run', matlabbatch);
end
