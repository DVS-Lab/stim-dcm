#!/bin/bash

# Ensure paths are correct irrespective from where user runs the script
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
basedir="$(dirname "$scriptdir")"

for task in cardgame; do	
	for sub in `cat ${basedir}/code/newsubs.txt`; do
		for run in 1 2 3; do
			if [ -e ${basedir}/derivatives/fmriprep/sub-${sub}/func/sub-${sub}_task-${task}_run-${run}_space-MNI152NLin2009cAsym_desc-preproc_bold.nii ]; then
				echo "File exists ${basedir}/derivatives/fmriprep/sub-${sub}/func/sub-${sub}_task-${task}_run-${run}_space-MNI152NLin2009cAsym_desc-preproc_bold.nii"
			else	
				gunzip ${basedir}/derivatives/fmriprep/sub-${sub}/func/sub-${sub}_task-${task}_run-${run}_space-MNI152NLin2009cAsym_desc-preproc_bold.nii.gz
			fi			
			export FSLOUTPUTTYPE=NIFTI
			fslsplit ${basedir}/derivatives/fmriprep/sub-${sub}/func/sub-${sub}_task-${task}_run-${run}_space-MNI152NLin2009cAsym_desc-preproc_bold.nii ${basedir}/derivatives/fmriprep/sub-${sub}/func/sub-${sub}_task-${task}_run-${run}_vol
			
			if [ -e ${basedir}/derivatives/spm/sub-${sub}/run-1/vol0000.nii ]; then
				echo "File exists ${basedir}/derivatives/spm/sub-${sub}/run-1/vol0000.nii"
			else
				echo "Copying vol files from fmriprep for sub-${sub} run-${run}"	
				mkdir ${basedir}/derivatives/spm/sub-${sub}/run-${run}/
				cp -r ${basedir}/derivatives/fmriprep/sub-${sub}/func/sub-${sub}_task-${task}_run-${run}_vol*.nii ${basedir}/derivatives/spm/sub-${sub}/run-${run}/
			fi	
		done
	done
done