#module "compute" {
#  source  = "app.terraform.io/TradersClub/compute/google"
#  version = "0.0.1"
# # Compute VM
#  project              = "tc-terraform-test"
#  compute-name         = "teste-vm"
#  machine-type         = "n1-standard-1"
#  region               = "us-central1"
#  instance-count       = "1"
#  disk-size            = "20"
#  disk-type            = "pd-ssd" 
#  network              = "vpc-tst-global"
#  subnetwork           = "subnet-tst-central1"  
#  depends_on           = [module.network]
#}
