#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --mail-user=marco.visani@students.unibe.ch 
#SBATCH --job-name=QC_trimmed_samples
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=01:00:00
#SBATCH --mem=1000MB

module add UHTS/Quality_control/fastqc/0.11.9

cd /home/mvisani/rna_seq/processed_sample
mkdir fastqc

fastqc -o ./fastqc -f fastq *.fastq.gz


