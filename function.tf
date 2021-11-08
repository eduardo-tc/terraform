#module "function" {
#  source  = "app.terraform.io/TradersClub/function/google"
#  version = "0.0.1"
# # Function
#  project                       = "tc-terraform-test"
#  region                        = "us-central1"
#  name                          = "tc-fun-testing"
#  description                   = "Para testes"
#  runtime                       = "nodejs10"
#  available_memory_mb           = "128"
#  timeout                       = "90"
#  max_instances                 = "0"
#  trigger_http                  = "true"
#  entry_point                   = "helloWorld"
#  ingress_settings              = "ALLOW_ALL"
#  vpc_connector                 = "projects/tc-terraform-test/locations/us-central1/connectors/tst-connetor-24-08"
#  vpc_connector_egress_settings = "ALL_TRAFFIC"
#}

