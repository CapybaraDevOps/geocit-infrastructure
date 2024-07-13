data "google_compute_network" "default" {
  name = "default"
}

data "google_netblock_ip_ranges" "netblock" {}

data "google_compute_ssl_certificate" "lb_ssl" {
  name = "capybaratest"
}

data "google_compute_network" "awx-network" {
  project = "capybara-stage"
  name    = "awx-network"
}
