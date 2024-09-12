resource "google_cloud_run_service" "service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image # Replace with your container image
        env {
          name  = "DB_HOST"
          value = var.db_host
        }
        env {
          name  = "DB_NAME"
          value = var.db_name
        }
        env {
          name  = "DB_USER"
          value = var.db_user
        }
        env {
          name  = "DB_PASSWORD"
          value = var.db_password
        }
      }
    }
  }
}

resource "google_cloud_run_service_iam_member" "service" {
  service = google_cloud_run_service.service.name
  location = google_cloud_run_service.service.location
  role    = "roles/run.invoker"
  member  = "allUsers"
}
