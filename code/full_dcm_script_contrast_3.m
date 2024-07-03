clear DCM
clear close clc
datapath = '/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-189/';


% SPECIFICATION DCMs "attentional modulation of backward/forward connection"
%--------------------------------------------------------------------------
% To specify a DCM, you might want to create a template one using the GUI
% then use spm_dcm_U.m and spm_dcm_voi.m to insert new inputs and new
% regions. The following code creates a DCM file from scratch, which
% involves some technical subtleties and a deeper knowledge of the DCM
% structure.

load(fullfile(datapath,'1stlevel_withConfounds','SPM.mat'));

% Load regions of interest
%--------------------------------------------------------------------------
load(fullfile(datapath,'1stlevel_withConfounds','VOI_L_vlPFC_1.mat'),'xY');
DCM.xY(1) = xY;
load(fullfile(datapath,'1stlevel_withConfounds','VOI_L_VS_1.mat'),'xY');
DCM.xY(2) = xY;

DCM.n = length(DCM.xY);      % number of regions
DCM.v = length(DCM.xY(1).u); % number of time points

% Time series
%--------------------------------------------------------------------------
DCM.Y.dt  = SPM.xY.RT;
DCM.Y.X0  = DCM.xY(1).X0;
for i = 1:DCM.n
    DCM.Y.y(:,i)  = DCM.xY(i).u;
    DCM.Y.name{i} = DCM.xY(i).name;
end

DCM.Y.Q    = spm_Ce(ones(1,DCM.n)*DCM.v);

% Experimental inputs
%--------------------------------------------------------------------------
DCM.U.dt   =  SPM.Sess(1).U(3).dt;
DCM.U.name = [SPM.Sess(1).U(3).name];
DCM.U.u    = [SPM.Sess(1).U(3).u(33:end,1)];

% DCM parameters and options
%--------------------------------------------------------------------------
DCM.delays = repmat(SPM.xY.RT/2,DCM.n,1);
DCM.TE     = 0.04;
DCM.options.nonlinear  = 0;
DCM.options.two_state  = 0;
DCM.options.stochastic = 0;
DCM.options.nograph    = 1;
DCM.options.centre = 1;
%% hypothesis 0
% 
A0{1} = [[1 0]; [1 1];];
% 
A0{2} = [[1 1]; [0 1];];
% 
A0{3} = [[1 0]; [0 1];];
%
A0{4} = [[1 1]; [1 1];];

C0{1} = [1 1];
C0{2} = [1 0];
C0{3} = [0 1];
m = 2;
n = 2;
allCombos = reshape((dec2bin(0:2^(n*m)-1)-'0')',n,m,[]);
allCombos = allCombos(:,:,2:end);
DCM.d = zeros(2,2,0);
for j=1:length(A0)
    DCM.a = A0{j};
    full_B = A0{j};
    num_combos = 2^nnz(full_B);
    for k=1:15
        [r,c] = find(full_B==0);
        m =  allCombos(:,:,k);
        are_zeros_in_m= all(m(sub2ind(size(m), r, c)) == 0);
        if are_zeros_in_m
            b_mat = allCombos(:,:,k);
            DCM.b(:,:,1) = b_mat;
            for l=1:length(C0)
                DCM.c = C0{l}';
                DCM.name = strcat('DCM_a',string(j),'_b',string(k),'_c',string(l),'_',DCM.U.name);
                fullFileName = fullfile(datapath, "1stlevel_withConfounds/DCM_Outputs/Family_0", DCM.name);
                save(fullFileName,'DCM')
            end
        end
    end
end
clear DCM
%% hypothesis 1
load(fullfile(datapath,'1stlevel_withConfounds','VOI_L_vlPFC_1.mat'),'xY');
DCM.xY(1) = xY;
load(fullfile(datapath,'1stlevel_withConfounds','VOI_dACC_1.mat'),'xY');
DCM.xY(2) = xY;

DCM.n = length(DCM.xY);      % number of regions
DCM.v = length(DCM.xY(1).u); % number of time points

% Time series
%--------------------------------------------------------------------------
DCM.Y.dt  = SPM.xY.RT;
DCM.Y.X0  = DCM.xY(1).X0;
for i = 1:DCM.n
    DCM.Y.y(:,i)  = DCM.xY(i).u;
    DCM.Y.name{i} = DCM.xY(i).name;
end

DCM.Y.Q    = spm_Ce(ones(1,DCM.n)*DCM.v);

% Experimental inputs
%--------------------------------------------------------------------------
DCM.U.dt   =  SPM.Sess(1).U(3).dt;
DCM.U.name = [SPM.Sess(1).U(3).name];
DCM.U.u    = [SPM.Sess(1).U(3).u(33:end,1)];

% DCM parameters and options
%--------------------------------------------------------------------------
DCM.delays = repmat(SPM.xY.RT/2,DCM.n,1);
DCM.TE     = 0.04;
DCM.options.nonlinear  = 0;
DCM.options.two_state  = 0;
DCM.options.stochastic = 0;
DCM.options.nograph    = 1;
DCM.options.centre = 1;
% 
A1{1} = [[1 0]; [1 1];];
% 
A1{2} = [[1 1]; [0 1];];
% 
A1{3} = [[1 0]; [0 1];];
%
A1{4} = [[1 1]; [1 1];];

C0{1} = [1 1];
C0{2} = [1 0];
C0{3} = [0 1];
m = 2;
n = 2;
allCombos = reshape((dec2bin(0:2^(n*m)-1)-'0')',n,m,[]);
allCombos = allCombos(:,:,2:end);
DCM.d = zeros(2,2,0);
for j=1:length(A0)
    DCM.a = A0{j};
    full_B = A0{j};
    num_combos = 2^nnz(full_B);
    for k=1:15
        [r,c] = find(full_B==0);
        m =  allCombos(:,:,k);
        are_zeros_in_m= all(m(sub2ind(size(m), r, c)) == 0);
        if are_zeros_in_m
            b_mat = allCombos(:,:,k);
            DCM.b(:,:,1) = b_mat;
            for l=1:length(C0)
                DCM.c = C0{l}';
                DCM.name = strcat('DCM_a',string(j),'_b',string(k),'_c',string(l),'_',DCM.U.name);
                fullFileName = fullfile(datapath, "1stlevel_withConfounds/DCM_Outputs/Family_1", DCM.name);
                save(fullFileName,'DCM')
            end
        end
    end
end
clear DCM
%% hypothesis 4
load(fullfile(datapath,'1stlevel_withConfounds','VOI_L_vlPFC_1.mat'),'xY');
DCM.xY(1) = xY;
load(fullfile(datapath,'1stlevel_withConfounds','VOI_L_VS_1.mat'),'xY');
DCM.xY(2) = xY;
load(fullfile(datapath,'1stlevel_withConfounds','VOI_dACC_1.mat'),'xY');
DCM.xY(3) = xY;

DCM.n = length(DCM.xY);      % number of regions
DCM.v = length(DCM.xY(1).u); % number of time points

% Time series
%--------------------------------------------------------------------------
DCM.Y.dt  = SPM.xY.RT;
DCM.Y.X0  = DCM.xY(1).X0;
for i = 1:DCM.n
    DCM.Y.y(:,i)  = DCM.xY(i).u;
    DCM.Y.name{i} = DCM.xY(i).name;
end

DCM.Y.Q    = spm_Ce(ones(1,DCM.n)*DCM.v);

% Experimental inputs
%--------------------------------------------------------------------------
DCM.U.dt   =  SPM.Sess(1).U(3).dt;
DCM.U.name = [SPM.Sess(1).U(3).name];
DCM.U.u    = [SPM.Sess(1).U(3).u(33:end,1)];

% DCM parameters and options
%--------------------------------------------------------------------------
DCM.delays = repmat(SPM.xY.RT/2,DCM.n,1);
DCM.TE     = 0.04;
DCM.options.nonlinear  = 0;
DCM.options.two_state  = 0;
DCM.options.stochastic = 0;
DCM.options.nograph    = 1;
DCM.options.centre = 1;
% 
A2{1} = [[1 1 0]; [0 1 1]; [1 1 1];];
% 
A2{2} = [[1 0 1]; [1 1 0]; [0 0 1];];
% 
A2{3} = [[1 0 0]; [0 1 0]; [0 0 1];];
%
A2{4} = [[1 1 1]; [1 1 1]; [1 1 1];];

C4{1} = [1 1 0];
C4{2} = [1 0 0];
C4{3} = [0 1 0];
m = 3;
n = 3;
allCombos = reshape((dec2bin(0:2^(n*m)-1)-'0')',n,m,[]);
allCombos = allCombos(:,:,2:end);
DCM.d = zeros(3,3,0);
for j=1:length(A2)
    DCM.a = A2{j};
    full_B = A2{j};
    num_combos = 2^nnz(full_B);
    for k=1:511
        [r,c] = find(full_B==0);
        m =  allCombos(:,:,k);
        are_zeros_in_m= all(m(sub2ind(size(m), r, c)) == 0);
        if are_zeros_in_m
            b_mat = allCombos(:,:,k);
            DCM.b(:,:,1) = b_mat;
            for l=1:length(C4)
                DCM.c = C4{l}';
                DCM.name = strcat('DCM_a',string(j),'_b',string(k),'_c',string(l),'_',DCM.U.name);
                fullFileName = fullfile(datapath, "1stlevel_withConfounds/DCM_Outputs/Family_2", DCM.name);
                save(fullFileName,'DCM')
            end
        end
    end
end
