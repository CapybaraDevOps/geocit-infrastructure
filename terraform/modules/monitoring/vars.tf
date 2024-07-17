variable "name" {
  type        = string
  description = "name of the VM instance"
  default     = "monitoring1"
}

variable "machine_type" {
  type        = string
  description = "machine type for VM instance"
  default     = "e2-medium"
}

variable "zone" {

  type        = string
  description = "region for DB"
  default     = "europe-west3-c"

}

variable "region" {
  description = "The region to create the resources in."
  type        = string
}

variable "image" {
  type        = string
  description = "image type"
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"

}

variable "project" {
  type        = string
  description = "id of project"
}

variable "app-vpc" {
  description = "Network for application"
}

variable "app-subnetwork" {
  description = "Subnetwork for application"
}
