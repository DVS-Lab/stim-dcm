%-----------------------------------------------------------------------
% Job saved on 23-May-2024 14:12:51 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
clear all; close all; clc
addpath /ZPOOL/data/tools/spm12/;
savepath;

spm fmri
matlabbatch{1}.spm.dcm.spec.fmri.group.output.dir = {'/ZPOOL/data/projects/stim-dcm/derivatives/spm/Group_DCM'};
matlabbatch{1}.spm.dcm.spec.fmri.group.output.name = 'Hypothesis_4_GCM';
matlabbatch{1}.spm.dcm.spec.fmri.group.template.fulldcm = {'/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-189/1stlevel_withConfounds/DCM_189_full.mat'};
matlabbatch{1}.spm.dcm.spec.fmri.group.template.altdcm = '';
%%
matlabbatch{1}.spm.dcm.spec.fmri.group.data.spmmats = {
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-189/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-203/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-207/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-208/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-209/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-210/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-211/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-212/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-213/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-214/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-215/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-216/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-217/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-218/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-219/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-220/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-221/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-222/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-225/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-226/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-227/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-228/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-230/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-231/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-232/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-233/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-234/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-235/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-236/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-237/1stlevel_withConfounds/SPM.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-238/1stlevel_withConfounds/SPM.mat'
                                                       };
%%
matlabbatch{1}.spm.dcm.spec.fmri.group.data.session = 1;
matlabbatch{1}.spm.dcm.spec.fmri.group.data.region = {
                                                      {'/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-189/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-203/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-207/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-208/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-209/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-210/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-211/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-212/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-213/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-214/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-215/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-216/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-217/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-218/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-219/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-220/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-221/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-222/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-225/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-226/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-227/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-228/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-230/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-231/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-232/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-233/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-234/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-235/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-236/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-237/1stlevel_withConfounds/VOI_L_VS_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-238/1stlevel_withConfounds/VOI_L_VS_1.mat'}
                                                      {'/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-189/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-203/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-207/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-208/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-209/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-210/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-211/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-212/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-213/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-214/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-215/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-216/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-217/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-218/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-219/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-220/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-221/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-222/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-225/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-226/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-227/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-228/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-230/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-231/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-232/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-233/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-234/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-235/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-236/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-237/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-238/1stlevel_withConfounds/VOI_L_vlPFC_1.mat'}
                                                      {'/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-189/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-203/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-207/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-208/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-209/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-210/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-211/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-212/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-213/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-214/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-215/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-216/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-217/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-218/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-219/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-220/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-221/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-222/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-225/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-226/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-227/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-228/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-230/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-231/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-232/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-233/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-234/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-235/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-236/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-237/1stlevel_withConfounds/VOI_dACC_1.mat'
                                                       '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-238/1stlevel_withConfounds/VOI_dACC_1.mat'}
                                                      }';
matlabbatch{2}.spm.dcm.estimate.dcms.gcmmat(1) = cfg_dep('Specify group: GCM mat File(s)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','gcmmat'));
matlabbatch{2}.spm.dcm.estimate.output.single.dir = {'/ZPOOL/data/projects/stim-dcm/derivatives/spm/Group_DCM'};
matlabbatch{2}.spm.dcm.estimate.output.single.name = 'Hypothesis_4_GCM';
matlabbatch{2}.spm.dcm.estimate.est_type = 1;
matlabbatch{2}.spm.dcm.estimate.fmri.analysis = 'time';
spm('defaults', 'FMRI');
spm_jobman('run', matlabbatch);
