%-----------------------------------------------------------------------
% Job saved on 09-Feb-2024 13:56:37 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
clear all; close all; clc
addpath /ZPOOL/data/tools/spm12/;
savepath;

spm fmri
nums = string([189,203,207:1:222,225:1:228,230:1:238]);
for jj=1:length(nums)
    matlabbatch{1}.spm.stats.con.spmmat = cellstr({'/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-'+nums(jj)+'/1stlevel_withConfounds/SPM.mat'});
    matlabbatch{1}.spm.stats.con.consess{1}.tcon.name = 'R_vlpfc';
    matlabbatch{1}.spm.stats.con.consess{1}.tcon.weights = [0 0 0 1/3];
    matlabbatch{1}.spm.stats.con.consess{1}.tcon.sessrep = 'repl';
    matlabbatch{1}.spm.stats.con.consess{2}.tcon.name = 'R_vs';
    matlabbatch{1}.spm.stats.con.consess{2}.tcon.weights = [0 1/3 0 0];
    matlabbatch{1}.spm.stats.con.consess{2}.tcon.sessrep = 'repl';
    matlabbatch{1}.spm.stats.con.consess{3}.tcon.name = 'P_vlpfc';
    matlabbatch{1}.spm.stats.con.consess{3}.tcon.weights = [0 0 1/3 0];
    matlabbatch{1}.spm.stats.con.consess{3}.tcon.sessrep = 'repl';
    matlabbatch{1}.spm.stats.con.consess{4}.tcon.name = 'P_vs';
    matlabbatch{1}.spm.stats.con.consess{4}.tcon.weights = [1/3 0 0 0];
    matlabbatch{1}.spm.stats.con.consess{4}.tcon.sessrep = 'repl';
    matlabbatch{1}.spm.stats.con.consess{5}.tcon.name = 'R>P';
    matlabbatch{1}.spm.stats.con.consess{5}.tcon.weights = [-1/3 1/3 -1/3 1/3];
    matlabbatch{1}.spm.stats.con.consess{5}.tcon.sessrep = 'repl';
    matlabbatch{1}.spm.stats.con.consess{6}.tcon.name = 'vlpfc>rtpj';
    matlabbatch{1}.spm.stats.con.consess{6}.tcon.weights = [-1/3 -1/3 1/3 1/3];
    matlabbatch{1}.spm.stats.con.consess{6}.tcon.sessrep = 'repl';
    matlabbatch{1}.spm.stats.con.consess{7}.tcon.name = 'R (vlpfc>rtpj)';
    matlabbatch{1}.spm.stats.con.consess{7}.tcon.weights = [0 -1/3 0 1/3];
    matlabbatch{1}.spm.stats.con.consess{7}.tcon.sessrep = 'repl';
    matlabbatch{1}.spm.stats.con.consess{8}.tcon.name = 'P (vlpfc>rtpj)';
    matlabbatch{1}.spm.stats.con.consess{8}.tcon.weights = [-1/3 0 1/3 0];
    matlabbatch{1}.spm.stats.con.consess{8}.tcon.sessrep = 'repl';
    matlabbatch{1}.spm.stats.con.consess{9}.tcon.name = 'interaction';
    matlabbatch{1}.spm.stats.con.consess{9}.tcon.weights = [1/3 -1/3 -1/3 1/3];
    matlabbatch{1}.spm.stats.con.consess{9}.tcon.sessrep = 'repl';
    matlabbatch{1}.spm.stats.con.consess{10}.fcon.name = 'f contrast';
    matlabbatch{1}.spm.stats.con.consess{10}.fcon.weights = [1 0 0 0
                                                            0 1 0 0
                                                            0 0 1 0
                                                            0 0 0 1];
    matlabbatch{1}.spm.stats.con.consess{10}.fcon.sessrep = 'repl';
    matlabbatch{1}.spm.stats.con.delete = 1;
    spm('defaults', 'FMRI');
    spm_jobman('run', matlabbatch);
end