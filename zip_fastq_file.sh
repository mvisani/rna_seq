#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --mail-user=marco.visani@students.unibe.ch 
#SBATCH --job-name=zip
#SBATCH --nodes=1
#SBATCH --cpus-per-task=10
#SBATCH --time=03:00:00
#SBATCH --mem=25GB

cd /data/users/mvisani/rna_seq/sample

gzip *.fastq
