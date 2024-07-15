output "load_balancer_ip_address" {
  description = "IP address of the Cloud Load Balancer"
  value       = google_compute_global_address.global_address.address
}

output "app-vpc" {
  description = "Network for application"
  value       = google_compute_network.app-network.name
}

output "app-vpc-id" {
  description = "Network for application"
  value       = google_compute_network.app-network.id
}


output "app-subnetwork" {
  description = "Subnetwork for application"
  value       = google_compute_subnetwork.app-subnetwork.name

}
