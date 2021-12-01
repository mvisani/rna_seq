#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --mail-user=marco.visani@students.unibe.ch 
#SBATCH --job-name=fa_to_2_bit
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=03:00:00
#SBATCH --mem=8000MB

cd /data/users/mvisani/rna_seq/prepare_annotation

module add SequenceAnalysis/blat/36;

# Convert genome FASTA file to 2bit format

# Download fatoTwoBit:

# For linux (http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/faToTwoBit)
# For Mac (http://hgdownload.soe.ucsc.edu/admin/exe/macOSX.x86_64/faToTwoBit)
# Other platforms (http://hgdownload.soe.ucsc.edu/admin/exe/)

# Make sure you have faToTwoBit in you PATH.

# Usage (https://genome.ucsc.edu/goldenPath/help/blatSpec.html#faToTwoBitUsage)

faToTwoBit Rattus_norvegicus.Rnor_6.0.dna.toplevel.fa Rattus_norvegicus.Rnor_6.0.dna.toplevel.2bit
