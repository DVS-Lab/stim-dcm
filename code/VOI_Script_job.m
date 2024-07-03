%-----------------------------------------------------------------------
% Job saved on 23-May-2024 12:03:45 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
clear all; close all; clc
addpath /ZPOOL/data/tools/spm12/;
savepath;

spm fmri
nums = string([189,203,207:1:222,225:1:228,230:1:238]);
for jj=1:length(nums)
    matlabbatch{1}.spm.util.voi.spmmat = cellstr({'/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-'+nums(jj)+'/1stlevel_withConfounds/SPM.mat'});
    matlabbatch{1}.spm.util.voi.adjust = 10;
    matlabbatch{1}.spm.util.voi.session = 1;
    matlabbatch{1}.spm.util.voi.name = 'L_vlPFC';
    matlabbatch{1}.spm.util.voi.roi{1}.spm.spmmat = cellstr({'/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-'+nums(jj)+'/1stlevel_withConfounds/SPM.mat'});
    matlabbatch{1}.spm.util.voi.roi{1}.spm.contrast = 5;
    matlabbatch{1}.spm.util.voi.roi{1}.spm.conjunction = 1;
    matlabbatch{1}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
    matlabbatch{1}.spm.util.voi.roi{1}.spm.thresh = 0.05;
    matlabbatch{1}.spm.util.voi.roi{1}.spm.extent = 0;
    matlabbatch{1}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});
    matlabbatch{1}.spm.util.voi.roi{2}.sphere.centre = [-43 43 -3];
    matlabbatch{1}.spm.util.voi.roi{2}.sphere.radius = 15;
    matlabbatch{1}.spm.util.voi.roi{2}.sphere.move.fixed = 1;
    matlabbatch{1}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
    matlabbatch{1}.spm.util.voi.roi{3}.sphere.radius = 8;
    matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
    matlabbatch{1}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2';
    matlabbatch{1}.spm.util.voi.expression = 'i1 & i3';
    matlabbatch{2}.spm.util.voi.spmmat = cellstr({'/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-'+nums(jj)+'/1stlevel_withConfounds/SPM.mat'});
    matlabbatch{2}.spm.util.voi.adjust = 10;
    matlabbatch{2}.spm.util.voi.session = 1;
    matlabbatch{2}.spm.util.voi.name = 'dACC';
    matlabbatch{2}.spm.util.voi.roi{1}.spm.spmmat = cellstr({'/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-'+nums(jj)+'/1stlevel_withConfounds/SPM.mat'});
    matlabbatch{2}.spm.util.voi.roi{1}.spm.contrast = 5;
    matlabbatch{2}.spm.util.voi.roi{1}.spm.conjunction = 1;
    matlabbatch{2}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
    matlabbatch{2}.spm.util.voi.roi{1}.spm.thresh = 0.05;
    matlabbatch{2}.spm.util.voi.roi{1}.spm.extent = 0;
    matlabbatch{2}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});
    matlabbatch{2}.spm.util.voi.roi{2}.sphere.centre = [-4 14 39];
    matlabbatch{2}.spm.util.voi.roi{2}.sphere.radius = 15;
    matlabbatch{2}.spm.util.voi.roi{2}.sphere.move.fixed = 1;
    matlabbatch{2}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
    matlabbatch{2}.spm.util.voi.roi{3}.sphere.radius = 8;
    matlabbatch{2}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
    matlabbatch{2}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2';
    matlabbatch{2}.spm.util.voi.expression = 'i1 & i3';
    matlabbatch{3}.spm.util.voi.spmmat = cellstr({'/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-'+nums(jj)+'/1stlevel_withConfounds/SPM.mat'});
    matlabbatch{3}.spm.util.voi.adjust = 10;
    matlabbatch{3}.spm.util.voi.session = 1;
    matlabbatch{3}.spm.util.voi.name = 'L_VS';
    matlabbatch{3}.spm.util.voi.roi{1}.spm.spmmat = cellstr({'/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-'+nums(jj)+'/1stlevel_withConfounds/SPM.mat'});
    matlabbatch{3}.spm.util.voi.roi{1}.spm.contrast = 5;
    matlabbatch{3}.spm.util.voi.roi{1}.spm.conjunction = 1;
    matlabbatch{3}.spm.util.voi.roi{1}.spm.threshdesc = 'none';
    matlabbatch{3}.spm.util.voi.roi{1}.spm.thresh = 0.05;
    matlabbatch{3}.spm.util.voi.roi{1}.spm.extent = 0;
    matlabbatch{3}.spm.util.voi.roi{1}.spm.mask = struct('contrast', {}, 'thresh', {}, 'mtype', {});
    matlabbatch{3}.spm.util.voi.roi{2}.sphere.centre = [-9 12 -9];
    matlabbatch{3}.spm.util.voi.roi{2}.sphere.radius = 15;
    matlabbatch{3}.spm.util.voi.roi{2}.sphere.move.fixed = 1;
    matlabbatch{3}.spm.util.voi.roi{3}.sphere.centre = [0 0 0];
    matlabbatch{3}.spm.util.voi.roi{3}.sphere.radius = 8;
    matlabbatch{3}.spm.util.voi.roi{3}.sphere.move.global.spm = 1;
    matlabbatch{3}.spm.util.voi.roi{3}.sphere.move.global.mask = 'i2';
    matlabbatch{3}.spm.util.voi.expression = 'i1 & i3';
    spm('defaults', 'FMRI');
    spm_jobman('run', matlabbatch);
end