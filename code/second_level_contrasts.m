% List of open inputs
nrun = 1; % enter the number of runs here
jobfile = {'/ZPOOL/data/projects/stim-dcm/code/second_level_contrasts_job.m'};
jobs = repmat(jobfile, 1, nrun);
inputs = cell(0, nrun);
for crun = 1:nrun
end
spm('defaults', 'FMRI');
spm_jobman('run', jobs, inputs{:});
