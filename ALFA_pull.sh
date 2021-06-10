#!/bin/bash

#SBATCH -c 1 			# Request one core
#SBATCH -N 1			# Request one node 

#SBATCH -t 0-12:00		# Run time D-HH:MM format
#SBATCH -p short		# Partition to run in
#SBATCH --mem=2000		# Memory total in MB (in all cores)
#SBATCH -e /home/gao4/clinvar-master/src/error/hostname_%j.err	# File to which STDERR will be written, including jobID                         # Change/Delete this
#SBATCH --mail-type=ALL		# Type of email notification- BEGIN, END, FAIL, ALL
#SBATCH --mail-user=grace.obrien@childrens.harvard.edu	# Email where notifications send to                                                     # Change/Delete this

# Loading required module
module load gcc/6.2.0 
module load python
pip install urllib


# 1. Run pull script. This pulls most updated ALFA database. It is GR38
python ALFA_pull.py


# 2. Rename with date
mv ALFA_freq.vcf.gz ALFA_freq_$(date +%F).vcf.gz

