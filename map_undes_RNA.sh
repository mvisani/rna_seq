#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --mail-user=marco.visani@students.unibe.ch 
#SBATCH --job-name=map_u_RNA
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=02:00:00
#SBATCH --mem=8000MB

cd /data/users/mvisani/rna_seq/sample

module add UHTS/Aligner/bowtie/1.2.0;


for x in $(ls -d *tr.fastq); \
do echo ${x}; \
bowtie \
-S \
-t \
-p 4 \
/data/users/mvisani/rna_seq/prepare_annotation/Rnor_r_sno_sn_t_RNA ${x} \
--un $(basename ${x} .fastq)_no_r_sno_sn_t-RNA.fastq \
2> $(basename ${x} .fastq)_no_r_sno_sn_t-RNA_log.txt > /dev/null; done
