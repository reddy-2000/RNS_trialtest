variable "region" {
  description = "The GCP region"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "service_name" {
  description = "The name of the Cloud Run service"
  type        = string
}

variable "image" {
  description = "The container image for the Cloud Run service"
  type        = string
}

variable "db_user" {
  description = "The database user"
  type        = string
}

variable "db_password" {
  description = "The database password"
  type        = string
}
