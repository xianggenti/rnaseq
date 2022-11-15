## Default testing
#nextflow run nf-core/rnaseq -profile test,docker --outdir ./results/ -N xiang.li@gentibio.com
#nextflow run nf-core/rnaseq --input /home/xli/code_archive/github/rnaseq/assets/samplesheet_EngTreg.csv --outdir ./results/EngTreg/ --genome GRCh38 -profile docker
#nextflow run nf-core/rnaseq --input /home/xli/code_archive/github/rnaseq/assets/samplesheet_EngTreg.csv \
--outdir ./results/EngTreg/ --genome GRCh38 -profile docker \
--max_cpus 7 --max_memory 24.GB \
--skip_qualimap --skip_markduplicates --skip_stringtie \
-N xiang.li@gentibio.com
