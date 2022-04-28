#!/bin/bash
samples_list=SRR_Acc_List_group2
for sample in `cat $samples_list`
do
        #fastq-dump --split -3 --gzip $sample
        R1=${sample}_1_paired.fastq.gz
        R2=${sample}_2_paired.fastq.gz

        #Sequece Alignment to a reference
        bwa mem  pseudomonas_ref.fna $R1 $R2 > ${sample}.sam
        #convert sam to compressed bam
        samtools view -b ${sample}.sam > ${sample}.bam
        #sorting the bam file
        samtools sort ${sample}.bam > ${sample}_sorted.bam
        #indexing the bam file
        samtools index ${sample}_sorted.bam
        #variant calling
        freebayes -f pseudomonas_ref.fna ${sample}_sorted.bam > ${sample}.vcf
        #next is to annotate vcf
done

echo "
done
