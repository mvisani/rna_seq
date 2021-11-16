#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --mail-user=marco.visani@students.unibe.ch 
#SBATCH --job-name=bowtie
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=03:00:00
#SBATCH --mem=8000MB

module add UHTS/Aligner/bowtie/1.2.0

mkdir /home/mvisani/rna_seq/prepare_annotation

cd /data/users/mvisani/rna_seq/prepare_annotation

gunzip Rattus_norvegicus.Rnor_6.0.dna.toplevel.fa.gz

bowtie-build Rnor_r_sno_sn_t_RNA.fa Rnor_r_sno_sn_t_RNA
bowtie-build Rattus_norvegicus.Rnor_6.0.dna.toplevel.fa Rattus_norvegicus.Rnor_6.0.dna.toplevel

cd /home/mvisani/rna_seq/prepare_annotation

ln -s /data/users/mvisani/rna_seq/prepare_annotation/*.ebwt .
ln -s /data/users/mvisani/rna_seq/prepare_annotation/Rnor_r_sno_sn_t_RNA.fa .
ln -s /data/users/mvisani/rna_seq/prepare_annotation/Rattus_norvegicus.Rnor_6.0.dna.toplevel.fa.gz .  
