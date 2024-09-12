resource "google_sql_database_instance" "instance" {
  name             = "${var.db_name}-instance"
  database_version = "POSTGRES_13"  
  region           = var.region

  settings {
    tier = "db-f1-micro"  

    ip_configuration {
      authorized_networks {
        name  = "public-network"
        value = "0.0.0.0/0"  # Open to the public; restrict this in production
      }
    }
  }
}

resource "google_sql_database" "db" {
  name           = var.db_name
  instance_name  = google_sql_database_instance.instance.name
}
