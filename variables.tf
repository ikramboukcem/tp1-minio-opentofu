variable "minio_server" {
  type        = string
  description = "Adresse du serveur MinIO"
  default     = "127.0.0.1:9000"
}

variable "minio_user" {
  type        = string
  description = "Utilisateur MinIO"
  sensitive   = true
}

variable "minio_password" {
  type        = string
  description = "Mot de passe MinIO"
  sensitive   = true
}

variable "bucket_name" {
  type        = string
  description = "Nom du bucket web"
  default     = "webbucket"
}

variable "index_file" {
  type        = string
  description = "Fichier HTML principal"
  default     = "index.html"
}

variable "style_file" {
  type        = string
  description = "Fichier CSS"
  default     = "style.css"
}
