#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --mail-user=marco.visani@students.unibe.ch 
#SBATCH --job-name=Rscript
#SBATCH --nodes=1
#SBATCH --cpus-per-task=10
#SBATCH --time=03:00:00
#SBATCH --mem=30GB

cd /data/users/mvisani/rna_seq/R_QC

module add R/3.6.1;
module add SequenceAnalysis/blat/36;

faToTwoBit Rattus_norvegicus.Rnor_6.0.dna.toplevel.fa.gz Rattus_norvegicus.Rnor_6.0.dna.toplevel.2bit

Rscript PerformQC.R
