#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --mail-user=marco.visani@students.unibe.ch 
#SBATCH --job-name=fastqc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=01:00:00
#SBATCH --mem=1000MB


module add UHTS/Quality_control/fastqc/0.11.9

cd /home/mvisani/rna_seq/cutadapt
mkdir fastqc

fastqc -o ./fastqc -f fastq *.fastq.gz
