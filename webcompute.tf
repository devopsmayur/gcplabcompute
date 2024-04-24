# Set GCP provider
provider "google" {
  project = "hc-2b6b12a0d1a54455ab3af0925b7"
  region  = "us-central1"
}

data "tfe_outputs" "test" {
    organization =  "devopsmayur"
    workspace = "gcplabnetwork"
}

# Create web server instance
resource "google_compute_instance" "web_server" {
  name         = "web-server"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  network_interface {
    network = default
}
}
}
