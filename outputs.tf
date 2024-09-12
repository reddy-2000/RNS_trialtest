output "database_instance_name" {
  value = module.database.instance_name
}

output "cloudrun_service_url" {
  value = module.cloudrun.service_url
}

output "loadbalancer_ip" {
  value = module.loadbalancer.global_address
}
