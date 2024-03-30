#!/bin/bash

# Ensure paths are correct irrespective from where user runs the script
scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
basedir="$(dirname "$scriptdir")"
#nruns=2

#for task in socialdoors; do
for task in trust; do
	for ppi in 0 "VS"; do #"VS_thr5" "dmn"; do # 0 "VS_thr5" "dmn"; do # putting 0 first will indicate "activation"
		#for sub in 10668; do #-- use this line for testing with one subject 
		for sub in `cat ${basedir}/code/sublist_all.txt`; do
	  		for run in 1 2; do

		  		# Manages the number of jobs and cores
		  		SCRIPTNAME=${basedir}/code/L1stats.sh
	  			NCORES=20
	  			while [ $(ps -ef | grep -v grep | grep $SCRIPTNAME | wc -l) -ge $NCORES ]; do
	    			sleep 5s
	  			done

	  		bash $SCRIPTNAME $sub $run $ppi $task &
	  		sleep 1s

			done	  	
	  	done
	done
done