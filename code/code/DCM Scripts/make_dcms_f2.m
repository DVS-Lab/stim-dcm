clear; clc
load("../../../derivatives/spm/sub-189/1stlevel_withConfounds/DCMs/DCM_f1_vlpfc_input_m1.mat")
m = 3;
n = 3;
allCombosB = reshape((dec2bin(0:2^(n*m)-1)-'0')',n,m,[]);
base_dir = "../../../derivatives/spm/sub-189/1stlevel_withConfounds/DCMs/";
[status, msg, msgID] = mkdir(base_dir);
allCombosA = zeros(m,n,64);
n = 1;
for j=1:512
    mat = allCombosB(:,:,j);
    if mat(1,1)==1 && mat(2,2)==1 && mat(3,3)==1
        allCombosA(:,:,n) = allCombosB(:,:,j);
        n = n+1;
    end
end
if status ~=1 
    mkdir(base_dir);
end
for t = 1:64
    matA = allCombosA(:,:,t);
    A = allCombosA(:,:,t) == 0;
    allCombosNew= allCombosB(:,:,A);
    for s=1:length(allCombosNew)
        matB = allCombosNew(:,:,s);
        % DCM.b(:,:,1) = allCombosB(:,:,s);
        % DCM.b(:,:,2) = allCombosB(:,:,s);
        % DCM.b(:,:,3) = allCombosB(:,:,s);
        % DCM.b(:,:,4) = allCombosB(:,:,s);
        % fullFileName = fullfile(base_dir,strcat('DCM_f'+string(t),'_vlpfc_input_m',string(s),'.mat'));
        % save(fullFileName,'DCM')
    end
end