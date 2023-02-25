S3_object_path=$1  ## S3 path must ends with /, as a folder
xx=$(find -name "*_val_*.gz")
for x in ${xx[*]}
do
aws s3 cp --follow-symlinks ${x} ${S3_object_path}
done
