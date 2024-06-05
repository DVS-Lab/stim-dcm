#!/bin/bash

# Ensure paths are correct irrespective from where user runs the script
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
basedir="$(dirname "$scriptdir")"

for task in cardgame; do
	for sub in `cat ${basedir}/code/newsubs.txt`; do
	gunzip ${basedir}/bids/sub-${sub}/anat/sub-${sub}_T1w.nii.gz	
		for run in 01 02 03; do
			gunzip ${basedir}/bids/sub-${sub}/func/sub-${sub}_task-${task}_run-${run}_bold.nii.gz
		done
	done
done