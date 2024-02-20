clear all; clc; close all;
addpath /ZPOOL/data/tools/spm12/;
savepath;

spm fmri

%% Script for running individual level stats across subs in SPM
% Changes that need to be made:
%   -Replace sub IDs with var
%   -Replace EV onsets & durations with var
%   -Question: can batch & contrasts be in the same script? Need to find
%   out



%% Code for stats:
nums = string([189,203,207:1:238]);
delete_files = input("Do you want to clear save directories? Press 1 if yes.");
file_nums_for_subjects = string(zeros(size(length(nums))));
if delete_files == 1
    for jj=1:length(nums)
        savedir = '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-'+nums(jj)+'/1stlevel_withConfounds';
        [status, msg, msgID] = mkdir(savedir);
        if status~=1
            mkdir(savedir);
        elseif status == 1
            delete(fullfile(savedir, '*'))
        end
    end
end
for jj=1:length(nums)
    disp(nums(jj))
    savedir = '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-'+nums(jj)+'/1stlevel_withConfounds';
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
            dir_to_check_1_2 = '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/';
            arry_1 = dir(dir_to_check_1_2+'**/*run-1_vol0*.nii');
            name_1 = {arry_1(1:end).name};
            for ii=1:length(name_1)
             file_to_store_1 = fullfile(dir_to_check_1_2,name_1{1,ii});
             if dir(file_to_store_1).bytes ~=0 
                 name_1{1,ii} = file_to_store_1;
             end
            end
            name_1 = name_1';
             matlabbatch{1}.spm.stats.fmri_spec.sess(1).scans = cellstr(name_1);
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
                confounds_run1 = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-"+nums(jj)+'/sub-'+nums(jj)+"_task-cardgame_run-1_desc-fslConfounds.tsv";
                save_dir_run1 = "/ZPOOL/data/projects/stim-dcm/derivatives/spm/confounds/sub-"+nums(jj)+"/sub-"+nums(jj)+"_task-cardgame_run-1_desc-fslConfounds";
                tsvtom(confounds_run1, save_dir_run1);
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
            dir_to_check_2_2 = '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/';
            arry_2 = dir(dir_to_check_2_2+'**/*run-2_vol0*.nii');
            name_2 = {arry_2(1:end).name};
            for ii=1:length(name_2)
             file_to_store_2 = fullfile(dir_to_check_2_2,name_2{1,ii});
             if dir(file_to_store_2).bytes ~=0 
                 name_2{1,ii} = file_to_store_2;
             end
            end
            name_2 = name_2';
            matlabbatch{1}.spm.stats.fmri_spec.sess(2).scans = cellstr(name_2);                                                   
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
            dir_to_check_3_2 = '/ZPOOL/data/projects/stim-dcm/derivatives/fmriprep/sub-'+nums(jj)+'/func/';
            arry_3 = dir(dir_to_check_3_2+'**/*run-3_vol0*.nii');
            name_3 = {arry_3(1:end).name};
            for ii=1:length(name_3)
             file_to_store_3 = fullfile(dir_to_check_3_2,name_3{1,ii});
             if dir(file_to_store_3).bytes ~=0 
                 name_3{1,ii} = file_to_store_3;
             end
            end
            name_3 = name_3';
            matlabbatch{1}.spm.stats.fmri_spec.sess(3).scans = cellstr(name_3);
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
