module "network" {
  source  = "app.terraform.io/TradersClub/network/google"
  version = "0.0.8"
  # insert required variables here
  project_id   = "tc-terraform-test"
  network_name = "vpc-tst-global"
  routing_mode = "REGIONAL"
  subnets = [
      {
          subnet_name           = "subnet-tst-central1"
          subnet_ip             = "172.20.16.0/22"
          subnet_region         = "us-central1"
      }
  ]
  secondary_ranges = {
      subnet-tst-central1 = [
          {
              range_name    = "subnet-secondary-gke-pods-tst-us-central1"
              ip_cidr_range = "172.16.0.0/14"
          },
          {
              range_name    = "subnet-secondary-gke-services-tst-us-central1"
              ip_cidr_range = "172.20.0.0/20"
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