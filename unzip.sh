#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --mail-user=marco.visani@students.unibe.ch
#SBATCH --job-name=map_u_RNA
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --time=02:00:00
#SBATCH --mem=25000MB

cd /data/users/mvisani/rna_seq/sample

gunzip *tr.fastq.gz


