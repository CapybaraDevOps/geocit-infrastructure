resource "google_compute_network" "app-network" {
  name                    = "app-network-${var.env}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name                     = "app-subnetwork-${var.env}"
  ip_cidr_range            = "10.102.0.0/20"
  region                   = var.region
  private_ip_google_access = true
  network                  = google_compute_network.app-network.id
}

resource "google_compute_network_peering" "app-awx" {
  name         = "app-awx-${var.env}"
  network      = google_compute_network.app-network.self_link
  peer_network = data.google_compute_network.awx-network.self_link
}

resource "google_compute_network_peering" "awx-app" {
  name         = "awx-app-${var.env}"
  network      = data.google_compute_network.awx-network.self_link
  peer_network = google_compute_network.app-network.self_link
}

resource "google_compute_firewall" "fw_ilb_to_backends" {
  name          = "${var.env}-${var.region}-fw-allow-ilb-to-backends"
  direction     = "INGRESS"
  network       = google_compute_network.app-network.id
  source_ranges = concat(["10.0.0.0/8"], data.google_netblock_ip_ranges.netblock.cidr_blocks_ipv4)
  target_tags   = ["http-server"]
  allow {
    protocol = "tcp"
    ports    = ["80", "443", "8080", "9100", "9200", "22"]
  }
}

resource "google_compute_url_map" "urlmap" {
  name            = "${var.env}-${var.region}-url-map"
  description     = "URL map for ${var.env}-${var.region} load balancer"
  default_service = google_compute_backend_service.api.self_link
}

resource "google_compute_url_map" "http-redirect" {
  name = "${var.env}-${var.region}-url-map-redirect"
  default_url_redirect {
    strip_query    = false
    https_redirect = true
  }
}

resource "google_compute_router" "default" {
  name    = "${var.env}-${var.region}-lb-http-router"
  network = google_compute_network.app-network.id
}

resource "google_compute_global_address" "global_address" {
  name         = "${var.env}-${var.region}-geo-global-address"
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}

resource "google_compute_target_http_proxy" "http-redirect" {
  name    = "${var.env}-${var.region}-geo-http-proxy"
  url_map = google_compute_url_map.http-redirect.self_link
}

resource "google_compute_global_forwarding_rule" "http-redirect" {
  name       = "${var.env}-${var.region}-geo-http-redirect-rule"
  target     = google_compute_target_http_proxy.http-redirect.self_link
  ip_address = google_compute_global_address.global_address.address
  port_range = "80"
}

resource "google_compute_global_forwarding_rule" "https" {
  name       = "${var.env}-${var.region}-https-rule"
  target     = google_compute_target_https_proxy.https.self_link
  ip_address = google_compute_global_address.global_address.address
  port_range = "443"
  depends_on = [google_compute_global_address.global_address]
  labels     = var.custom_labels
}

resource "google_compute_target_https_proxy" "https" {
  name    = "${var.env}-${var.region}-https-proxy"
  url_map = google_compute_url_map.urlmap.id
  ssl_certificates = [
    data.google_compute_ssl_certificate.lb_ssl.self_link
  ]
}
