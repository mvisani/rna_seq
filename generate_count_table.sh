#!/bin/bash

#SBATCH --mail-type=end,fail
#SBATCH --mail-user=marco.visani@students.unibe.ch 
#SBATCH --job-name=
#SBATCH --nodes=1
#SBATCH --cpus-per-task=5
#SBATCH --time=03:00:00
#SBATCH --mem=20GB

cd /data/users/mvisani/rna_seq/diff_expr_analysis

module add UHTS/Analysis/subread/2.0.1;

gunzip /data/users/mvisani/rna_seq/R_QC/Rattus_norvegicus.Rnor_6.0.104.gtf.gz

# Count reads on CDS
featureCounts -T 4 -t CDS -g gene_id -a /data/users/mvisani/rna_seq/R_QC/Rattus_norvegicus.Rnor_6.0.104.gtf -o CDS_counts_rawfile.txt *_sorted.bam

# Extract GeneID and Sample columns
cut -f 1,7-12 CDS_counts_rawfile.txt > CDS_counts_processed.txt




# Extract reads mapped to different biotypes
featureCounts -T 4 -t exon -g gene_biotype -a /data/users/mvisani/rna_seq/R_QC/Rattus_norvegicus.Rnor_6.0.104.gtf -o biotype_counts_rawfile.txt *_sorted.bam

# Extract Biotype and Sample columns
cut -f 1,7-12 biotype_counts_rawfile.txt > biotype_counts_processed.txt
