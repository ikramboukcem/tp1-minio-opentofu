output "bucket_name" {
  description = "Nom du bucket MinIO"
  value       = minio_s3_bucket.web_bucket.bucket
}

output "uploaded_files" {
  description = "Fichiers uploadés dans le bucket"
  value = [
    minio_s3_object.index_html.object_name,
    minio_s3_object.style_css.object_name
  ]
}
