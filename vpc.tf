variable "project_id" {
  description = "pjt-an3-gketest-dev"
}

variable "region" {
  description = "region"
}

provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("/var/lib/jenkins/pjt-an3-gketest-dev-78cdd3d69f38.json")

}

data "google_compute_subnetwork" "subnet" {
  #name    = "sbn-test-1"
  name    = "sbn-test-4"
  project = "vpc-share-network"
  #region  = "asia-northeast3"
  region  = "asia-northeast1"
}
data "google_compute_network" "network" {
  name    = "vpc-network"
}
# VPC


