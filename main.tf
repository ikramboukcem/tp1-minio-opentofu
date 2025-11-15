terraform {
  required_providers {
    minio = {
      source  = "terraform-provider-minio/minio"
      version = ">= 3.1.0"
    }
  }
}

provider "minio" {
  minio_server   = var.minio_server
  minio_user     = var.minio_user
  minio_password = var.minio_password
}

resource "minio_s3_bucket" "web_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
}

resource "minio_s3_bucket" "private_bucket" {
  bucket = "privatebucket"
  acl    = "private"
}


resource "minio_s3_object" "index_html" {
  bucket_name = minio_s3_bucket.web_bucket.bucket
  object_name = var.index_file
  source      = var.index_file
}

resource "minio_s3_object" "style_css" {
  bucket_name = minio_s3_bucket.web_bucket.bucket
  object_name = var.style_file
  source      = var.style_file
}
