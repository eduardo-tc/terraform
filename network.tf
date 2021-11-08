module "network" {
  source  = "app.terraform.io/TradersClub/network/google"
  version = "0.0.8"
  # insert required variables here
  project_id   = "tc-terraform-test"
  network_name = "vpc-k8s-teste"
  routing_mode = "REGIONAL"
  subnets = [
      {
          subnet_name           = "subnet-k8s-central1"
          subnet_ip             = "10.4.0.0/20"
          subnet_region         = "us-central1"
      }
  ]
  secondary_ranges = {
      subnet-k8s-central1 = [
          {
              range_name    = "subnet-secondary-gke-pods-k8s-us-central1"
              ip_cidr_range = "10.5.0.0/20"
          },
          {
              range_name    = "subnet-secondary-gke-services--us-central1"
              ip_cidr_range = "10.6.0.0/20"
          },
      ]
  }
  routes = [
      {
          name                   = "egress-internet"
          description            = "route through IGW to access internet"
          destination_range      = "0.0.0.0/0"
          tags                   = "egress-inet"
          next_hop_internet      = "true"
      },
  ]
}