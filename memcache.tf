module "memcache" {
  source  = "app.terraform.io/TradersClub/memcache/google"
  version = "3.0.3"
  name           = "memcachetst"
  project        = "tc-terraform-test"
  memory_size_mb = "1024"
  node_count     = "1"
  cpu_count      = "1"
  region         = "us-central1"
  display_name   = "tstmemcache"
}
