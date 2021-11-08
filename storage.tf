#module "storage" {
#  source  = "app.terraform.io/TradersClub/storage/google"
#  version = "0.0.1"
#  # insert required variables here
#  project_id  = "tc-terraform-test"
#  names = ["tst1", "tst2", "tst3"]
#  prefix = "tc-storage"
#  set_admin_roles = true
#  versioning = {
#    tst1 = true
#  }
#  bucket_admins = {
#    tst2 = "serviceAccount:nodepool@tc-terraform-test.iam.gserviceaccount.com"
#  }
#  depends_on   = [module.service-account]
#}

