#!/bin/bash
samples_list=SRR_Acc_List_group2
for sample in `cat $samples_list`
do
        #fastq-dump --split -3 --gzip $sample
        R1=${sample}_1.fastq.gz
        R2=${sample}_2.fastq.gz


        trimmomatic PE -threads 6 -phred33 -trimlog Group2.log $R1 $R2  ${sample}_1_paired.fastq.gz ${sample}_1_unpaired.fastq.gz ${sample}_2_paired.fastq.gz ${sample}_2_unpaired.fastq.gz LEADING:15 TRAILING:15 SLIDINGWINDOW:4:15

done

echo "
done"
