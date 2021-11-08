# Configurar provider GCP
provider "google" {
 project     = var.project_id
}

# Configurar K8S
provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Criar a primeira VPC Network
resource "google_compute_network" "vpc_network1" {
  name        = "dev-cicd-env"
  description = "VPC Network for k8s"
  project     = var.project_id
  auto_create_subnetworks = false
}

# Criar Subnetwork VPC
resource "google_compute_subnetwork" "subnetwork1" {
  name          = "k8s-subnet"
  ip_cidr_range = "10.4.0.0/16"
  project       = var.project_id
  region        = var.region
  network       = google_compute_network.vpc_network1.id

  depends_on = [
    google_compute_network.vpc_network1
  ]
}

# Criar Container Cluster
resource "google_container_cluster" "gke_cluster1" {
  name     = "cicd-jenkins"
  description = "cicd - Jenkins"
  project = var.project_id
  location = var.region
  network = google_compute_network.vpc_network1.name
  subnetwork = google_compute_subnetwork.subnetwork1.name
  remove_default_node_pool = true
  initial_node_count       = 1


  depends_on = [
    google_compute_subnetwork.subnetwork1
  ]
}


# Criar node Pool para Container Cluster
resource "google_container_node_pool" "nodepool1" {
  name       = "node-pool"
  project    = var.project_id
  location   = var.region
  cluster    = google_container_cluster.gke_cluster1.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-custom-2-8192"
  }

  autoscaling {
    min_node_count = 2
    max_node_count = 4
  }

  depends_on = [
    google_container_cluster.gke_cluster1
  ]
}

# Definir projeto atual no gcloud SDK
resource "null_resource" "set_gcloud_project" {
  provisioner "local-exec" {
    command = "gcloud config set project ${var.project_id}"
  }  
}

# Configurar Kubectl com GCP K8s Cluster
resource "null_resource" "configure_kubectl" {
  provisioner "local-exec" {
    command = "gcloud container clusters get-credentials ${google_container_cluster.gke_cluster1.name} --zone ${google_container_cluster.gke_cluster1.location} --project ${google_container_cluster.gke_cluster1.project}"
  } 

  depends_on = [
    null_resource.set_gcloud_project,
    google_container_cluster.gke_cluster1
  ]
}

output "url" {
  value = "https://${google_container_cluster.gke_cluster1.endpoint}"
}