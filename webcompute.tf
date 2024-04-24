# Set GCP provider
provider "google" {
  project = "hc-2b6b12a0d1a54455ab3af0925b7"
  region  = "us-central1"
}

# Reference subnets
data "google_compute_subnetwork" "web_subnet" {
  name    = google_compute_subnetwork.web_subnet.name
  region  = google_compute_subnetwork.web_subnet.region
}

# Reference VPC network
data "google_compute_network" "vpc_network" {
  name = google_compute_network.vpc_network.name
}
