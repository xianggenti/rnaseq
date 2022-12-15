PATH_S3=$1  #s3://upload-only-gentibio/uploads/30-776133146/
PATH_fastq=$2


aws s3 sync ${PATH_S3} ${PATH_fastq} --force-glacier-transfer #in case for restored files

wget -L https://raw.githubusercontent.com/nf-core/rnaseq/master/bin/fastq_dir_to_samplesheet.py
chmod 744 ./fastq_dir_to_samplesheet.py
 
./fastq_dir_to_samplesheet.py ${PATH_fastq} ${PATH_fastq}/samplesheet_ST2_Treg.csv


## Default testing
#nextflow run nf-core/rnaseq -profile test,docker --outdir ./results/ \

nextflow run nf-core/rnaseq --input ${PATH_fastq}/samplesheet.csv \
--outdir ./results/samples/ -profile docker \
--max_cpus 16 --max_memory 128.GB \
--skip_fastqc --skip_qualimap --skip_markduplicates --skip_stringtie \
-N xiang.li@gentibio.com \
--genome GRCh38 \ ## default genome
--fasta /home/ec2-user/Processed_Data/ST2_LENTI.fa \
--gtf /home/ec2-user/Processed_Data/ST2_LENTI.gtf \
-resume
#--skip_trimming \
