#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --mail-user=marco.visani@students.unibe.ch 
#SBATCH --job-name=map_genome
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --time=03:00:00
#SBATCH --mem=25GB

cd /data/users/mvisani/rna_seq/sample

module add UHTS/Aligner/bowtie/1.2.0;
module add UHTS/Analysis/samtools/1.10;

for x in $(ls -d *RNA.fastq); \
do echo ${x}; \
bowtie \
-S \
-t \
-p 4 \
-v 1 \
-m 1 \
--best \
--strata \
/data/users/mvisani/rna_seq/prepare_annotation/Rattus_norvegicus.Rnor_6.0.dna.toplevel \
-q ${x} \
2> $(basename ${x} .fastq)_Rnor_6_log.txt | \
samtools view -h -F 4 -b > $(basename ${x} .fastq)_Rnor_6.bam; done

# Sort the BAM file

for x in $(ls -d *.bam); \
do echo ${x}; \
samtools sort \
-@ 4 \
${x} \
-o $(basename ${x} .bam)_sorted.bam; done
