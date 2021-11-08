module "gke" {
  source  = "app.terraform.io/TradersClub/gke/google"
  version = "0.0.1"
  cluster_name                  = "k8s-cicd"
  project_id                    = "tc-terraform-test"
  location                      = "us-central1"
  min_master_version            = "latest"
  network                       = "vpc-tst-global"
  subnetwork                    = "subnet-k8s-central1"
  cluster_secondary_range_name  = "subnet-secondary-gke-pods-k8s-us-central1"
  services_secondary_range_name = "subnet-secondary-gke-services-k8s-us-central1"
  
  /**************************
   Nodepool
   **************************/

    nodepools = [
      {
          nodepool_name         = "np-k8s"
          nodepool_location     = "us-central1"
          initial_node_count    = 3
          version               = "latest"
          min_node_count        = 1
          max_node_count        = 5
          preemptible           = false
          machine_type          = "e2-medium"
      },
#      {
#          nodepool_name         = "np-tst2"
#          nodepool_location     = "us-central1"
#          initial_node_count    = 3
#          version               = "latest"
#          min_node_count        = 1
#          max_node_count        = 5
#          preemptible           = false
#          machine_type          = "e2-medium"
#      },

  ]
    node_locations = [
    "us-central1-c"
#    "us-central1-a"
  ]
  service_account     = "nodepool@tc-terraform-test.iam.gserviceaccount.com"
  depends_on   = [module.network, module.service-account]
}
