variable "region" {
  description = "region"
  type        = string
}

variable "service_name" {
  description = "Cloud Run service name"
  type        = string
}

variable "image" {
  description = "The container image for the Cloud Run service"
  type        = string
}

variable "db_host" {
  description = "The database host"
  type        = string
}

variable "db_name" {
  description = "The database name"
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
