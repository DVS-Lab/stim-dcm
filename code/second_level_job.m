clear all; clc; close all;
addpath /ZPOOL/data/tools/spm12/;
savepath;

spm fmri
%-----------------------------------------------------------------------
% Job saved on 21-Feb-2024 08:37:28 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
contrasts = string(1:1:9);
for jj=1:length(contrasts)
        savedir = '/ZPOOL/data/projects/stim-dcm/derivatives/spm/2ndlevel_contrast'+contrasts(jj);
        [status, msg, msgID] = mkdir(savedir);
        if status~=1
            mkdir(savedir);
        end
end
for ii=1:length(contrasts)
    savedir = '/ZPOOL/data/projects/stim-dcm/derivatives/spm/2ndlevel_contrast'+contrasts(ii);
    matlabbatch{1}.spm.stats.factorial_design.dir = cellstr({savedir});
    %%
    matlabbatch{1}.spm.stats.factorial_design.des.t1.scans = cellstr({
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-189/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-203/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-207/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-208/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-209/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-210/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-211/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-212/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-213/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-214/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-215/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-216/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-217/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-218/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-219/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-220/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-221/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-222/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-223/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-224/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-225/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-226/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-227/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-228/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-229/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-230/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-231/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-232/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-233/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-234/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-235/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-236/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-237/1stlevel_withConfounds/con_000'+contrasts(ii)+'.nii,1'
                                                              });
    %%
    matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
    matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
    matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
    matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
    matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
    matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
    matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
    matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
    matlabbatch{2}.spm.stats.fmri_est.spmmat = cellstr({'/ZPOOL/data/projects/stim-dcm/derivatives/spm/2ndlevel_contrast'+contrasts(ii)+'/SPM.mat'});
    matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
    matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
    spm('defaults', 'FMRI');
    spm_jobman('run', matlabbatch);
end