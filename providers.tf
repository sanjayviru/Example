provider "google" {
  project = var.gcp_project_id
  region  = var.region
}

data "google_container_cluster" "jenkins_gke" {
  name     = var.gke_cluster_name
  location = var.gke_location
  project  = var.gcp_project_id
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${data.google_container_cluster.jenkins_gke.endpoint}"
  cluster_ca_certificate = base64decode(data.google_container_cluster.jenkins_gke.master_auth[0].cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
  load_config_file       = false
}

provider "helm" {
  kubernetes = {
    host                   = "https://${data.google_container_cluster.jenkins_gke.endpoint}"
    cluster_ca_certificate = base64decode(data.google_container_cluster.jenkins_gke.master_auth[0].cluster_ca_certificate)
    token                  = data.google_client_config.default.access_token
    load_config_file       = false
  }
}

