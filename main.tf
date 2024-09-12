module "database" {
  source   = "./modules/database"
  region   = var.region
  db_name   = var.db_name
}

module "cloudrun" {
  source         = "./modules/cloudrun"
  region         = var.region
  service_name   = var.service_name
  image          = var.image
  db_host        = google_sql_database_instance.instance.public_ip_address[0].ip_address
  db_name        = var.db_name
  db_user        = var.db_user
  db_password    = var.db_password
}

module "loadbalancer" {
  source               = "./modules/loadbalancer"
  backend_service_group = module.cloudrun.service_url
}
