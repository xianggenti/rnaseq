PATH_S3=$1  #s3://upload-only-gentibio/uploads/30-776133146/
PATH_fastq=$2


aws s3 sync ${PATH_S3} ${PATH_fastq}

wget -L https://raw.githubusercontent.com/nf-core/rnaseq/master/bin/fastq_dir_to_samplesheet.py
chmod 744 ./fastq_dir_to_samplesheet.py
 
./fastq_dir_to_samplesheet.py ${PATH_fastq} ${PATH_fastq}/samplesheet_ST2_Treg.csv


## Default testing
#nextflow run nf-core/rnaseq -profile test,docker --outdir ./results/ \

nextflow run nf-core/rnaseq --input ${PATH_fastq}/samplesheet_ST2_Treg.csv \
--outdir ./results/ST2_Treg/ --genome GRCh38 -profile docker \
--max_cpus 63 --max_memory 250.GB \
--skip_qualimap --skip_markduplicates --skip_stringtie \
-N xiang.li@gentibio.com \
-resume
#--skip_trimming \
