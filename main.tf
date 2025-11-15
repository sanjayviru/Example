resource "helm_release" "jenkins" {
  provider         = helm
  name             = "jenkins"
  repository       = "https://charts.jenkins.io/"
  chart            = "jenkins"
  version          = var.jenkins_chart_version
  namespace        = var.jenkins_namespace
  create_namespace = true
}

