# Set GCP provider
provider "google" {
  project = "hc-2b6b12a0d1a54455ab3af0925b7"
  region  = "us-central1"
}

data "tfe_outputs" "nw" {
    organization =  "devopsmayur"
    workspace = "gcplabnetwork"
}


# Create web server instance
resource "google_compute_instance" "web_server1" {
  name         = "web-server"
  machine_type = "e2-micro"
  zone         = "us-central1-a"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
network_interface {
    network = data.tfe_outputs.nw.id

    access_config {
      // Ephemeral public IP
    }
  }

}

