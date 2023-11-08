PATH_S3=$1  #s3://upload-only-gentibio/uploads/30-776133146/  # reach to the folder contains FASTQ.gz
PATH_fastq=$2
Name_Sample_Sheet="samplesheet_GNTI_122_Treg.csv"

aws s3 sync ${PATH_S3} ${PATH_fastq} --force-glacier-transfer #in case for restored files

wget -L https://raw.githubusercontent.com/nf-core/rnaseq/master/bin/fastq_dir_to_samplesheet.py
chmod 744 ./fastq_dir_to_samplesheet.py


echo "./fastq_dir_to_samplesheet.py ${PATH_fastq}/ ${PATH_fastq}/${Name_Sample_Sheet}"
./fastq_dir_to_samplesheet.py ${PATH_fastq}/ ${PATH_fastq}/${Name_Sample_Sheet} \
#--read1_extension "_1_val_1.fq.gz" --read2_extension "_2_val_2.fq.gz"

## Default testing
#nextflow run nf-core/rnaseq -profile test,docker --outdir ./results/ \

nextflow run nf-core/rnaseq --input ${PATH_fastq}/${Name_Sample_Sheet} \
--outdir ./results/samples/ -profile docker \
--max_cpus 31 --max_memory 250.GB \
--skip_fastqc --skip_qualimap --skip_markduplicates --skip_stringtie \
-N xiang.li@gentibio.com \
--genome GRCh38 \
-resume #0a19b60d-d5fe-4a26-9e01-7a63d0a1d300 (##session ID from nextflow log)

### OPtional following:
#--fasta /home/ec2-user/Processed_Data/ST2_LENTI.fa \
#--gtf /home/ec2-user/Processed_Data/ST2_LENTI.gtf \
#--skip_trimming \
