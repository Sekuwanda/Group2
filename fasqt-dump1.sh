#!/bin/bash

samples_list=SRR_Acc_List_group2

for sample in `cat $samples_list`
do
	fastq-dump --split-3 --gzip $sample --outdir .
done


