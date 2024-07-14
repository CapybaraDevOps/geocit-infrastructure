provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

provider "google" {
  project     = "capybara-stage"
  region      = var.region
  zone        = var.zone
  alias       = "stage"
  credentials = file("${WORKSPACE}/terraform/environments/sa.json")
}
