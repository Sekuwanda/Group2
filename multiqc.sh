#!/bin/bash

samples_list=SRR_Acc_List_group2
for sample in `cat $samples_list`
do
        #fastq-dump --split -3 --gzip $sample
        r1=${sample}_1.fastq.gz
        r2=${sample}_2.fastq.gz

        fastqc $r1 $r2
done

echo "
done"

