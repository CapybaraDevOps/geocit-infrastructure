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
  alias       = "capybara-stage"
  credentials = file("/home/user/capybara-stage.json")
}


