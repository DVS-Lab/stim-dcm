clear; clc
load("../../../derivatives/spm/sub-189/1stlevel_withConfounds/DCM/DCM_123_f1_vlpfc_input_m1.mat")
m = 3;
n = 3;
allCombos = reshape((dec2bin(0:2^(n*m)-1)-'0')',n,m,[]);
base_dir = "../../../derivatives/spm/sub-189/1stlevel_withConfounds/DCM/";
[status, msg, msgID] = mkdir(base_dir);
if status ~=1 
    mkdir(base_dir);
end
for s=1:512 
    DCM.b(:,:,1) = allCombos(:,:,s);
    DCM.b(:,:,2) = allCombos(:,:,s);
    DCM.b(:,:,3) = allCombos(:,:,s);
    DCM.b(:,:,4) = allCombos(:,:,s);
    fullFileName = fullfile(base_dir,strcat('DCM_123_fb_vlpfc_input_m',string(s),'.mat'));
    save(fullFileName,'DCM')
end