resource "google_compute_global_address" "default" {
  name = "global-address"
}

resource "google_compute_backend_service" "default" {
  name        = "backend-service"
  protocol    = "HTTP"
  port_name   = "http"
  timeout_sec = 10

  backend {
    group = var.backend_service_group
  }

  enable_cdn = false
}

resource "google_compute_url_map" "default" {
  name            = "url-map"
  default_service  = google_compute_backend_service.default.id
}

resource "google_compute_target_http_proxy" "default" {
  name    = "http-proxy"
  url_map = google_compute_url_map.default.id
}

resource "google_compute_global_forwarding_rule" "default" {
  name        = "global-forwarding-rule"
  ip_address  = google_compute_global_address.default.address
  target      = google_compute_target_http_proxy.default.id
  port_range  = "80"
}
