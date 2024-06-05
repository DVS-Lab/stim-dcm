#!/bin/bash

# ensure paths are correct irrespective from where user runs the script
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
basedir="$(dirname "$scriptdir")"

#for sub in 189; do
for sub in `cat ${scriptdir}/newsubs.txt`; do
	for run in 1 2 3; do
		input=/ZPOOL/data/projects/r21-cardgame/derivatives/fsl/sub-${sub}/L1_task-cardgame_model-01_type-act_run-0${run}_sm-6_dcm.feat/filtered_func_data.nii.gz
		fslsplit $input
		output=/ZPOOL/data/projects/stim-dcm/derivatives/spm/sub-${sub}/run-${run}
		mkdir $output		
		for vol in vol*.nii.gz; do
			gunzip ${vol}
		done
		mv vol*.nii $output
	done
done
