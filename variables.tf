variable "gcp_project_id" {
  description = "GCP project ID"
  type        = string
  default = "gcp-test-472411"
}

variable "gke_cluster_name" {
  description = "The name of the existing GKE cluster"
  type        = string
  default = "autopilot-cluster-1"
}

variable "gke_location" {
  description = "Location/region/zone of your GKE cluster"
  type        = string
  default = "us-central1"
}

variable "region" {
  description = "Google Cloud region (for provider config)"
  type        = string
  default = "us-central1"
}

variable "jenkins_chart_version" {
  description = "Version of Jenkins Helm chart to install"
  type        = string
  default     = "5.8.107" 
}

variable "jenkins_namespace" {
  description = "Kubernetes namespace for Jenkins deployment"
  type        = string
  default     = "my-jenkins"
}

variable "jenkins_values" {
  description = "Map of Helm values to pass to the Jenkins chart"
  type        = map(any)
  default     = {}
}

