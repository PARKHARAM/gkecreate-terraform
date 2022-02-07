variable "project_id" {
  description = "eloquent-marker-338005"
}

variable "region" {
  description = "region"
}

provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("/var/lib/jenkins/eloquent-marker-338005-1fa6b785f519.json")
  #credentials = file("C:/key/pjt-an3-gketest-dev-78cdd3d69f38.json")
}


data "google_compute_network" "network" {
  name    = "vpc-network"
}
# VPC


