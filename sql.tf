#module "preprod-tcserver" {
#  source  = "app.terraform.io/TradersClub/sql/google"
#  version = "4.0.4"
# # Instance Sql
#  project              = "tc-terraform-test"
#  database_name        = "tcserver-a"
#  region               = "us-central1"
#  database_version     = "MYSQL_5_7"
#  tier                 =  "db-custom-8-30720"
#  disk_size            = "274"
#  disk_type            = "PD_SSD"
# #Sql database
#  name                 = "preprod-tcserver-a"
#  db_user              = "tst"
#  db_password          = "Tc@321"
#  project_database     = "tc-terraform-test"
#}
#module "tc-abalustre-worker" {
#  source  = "app.terraform.io/TradersClub/sql/google"
#  version = "4.0.2"
# # Instance Sql
#  project              = "tc-terraform-test"
#  database_name        = "ellstre-worker"
#  region               = "us-central1"
#  database_version     = "MYSQL_8_0"
#  tier                 =  "db-custom-1-3840"
#  disk_size            = "10"
#  disk_type            = "PD_SSD"
# #Sql database
#  name                 = "rltc-abalustre-worker"
#  db_user              = "tst"
#  db_password          = "Tc@321"
#  project_database     = "tc-terraform-test"
#}
#module "tc-accesscontrolapi-new" {
#  source  = "app.terraform.io/TradersClub/sql/google"
#  version = "4.0.2"
# # Instance Sql
#  project              = "tc-terraform-test"
#  database_name        = "ellolapi-new"
#  region               = "us-central1"
#  database_version     = "MYSQL_8_0"
#  tier                 =  "db-custom-1-3840"
#  disk_size            = "10"
#  disk_type            = "PD_SSD"
# #Sql database
#  name                 = "rltc-accesscontrolapi-new"
#  db_user              = "tst"
#  db_password          = "Tc@321"
#  project_database     = "tc-terraform-test"
#}
#module "tc-cel-preprod" {
#  source  = "app.terraform.io/TradersClub/sql/google"
#  version = "4.0.2"
# # Instance Sql
#  project              = "tc-terraform-test"
#  database_name        = "ellaaa-preprod"
#  region               = "us-central1"
#  database_version     = "MYSQL_8_0"
#  tier                 =  "db-custom-1-3840"
#  disk_size            = "10"
#  disk_type            = "PD_SSD"
# #Sql database
#  name                 = "rltc-cel-preprod"
#  db_user              = "tst"
#  db_password          = "Tc@321"
#  project_database     = "tc-terraform-test"
#}
#module "tc-ideas" {
#  source  = "app.terraform.io/TradersClub/sql/google"
#  version = "4.0.2"
# # Instance Sql
#  project              = "tc-terraform-test"
#  database_name        = "ellpreasifws"
#  region               = "us-central1"
#  database_version     = "MYSQL_8_0"
#  tier                 =  "db-custom-1-3840"
#  disk_size            = "10"
#  disk_type            = "PD_SSD"
# #Sql database
#  name                 = "rltc-ideas"
#  db_user              = "tst"
#  db_password          = "Tc@321"
#  project_database     = "tc-terraform-test"
#}
#module "tc-incometax" {
#  source  = "app.terraform.io/TradersClub/sql/google"
#  version = "4.0.2"
# # Instance Sql
#  project              = "tc-terraform-test"
#  database_name        = "ellletax"
#  region               = "us-central1"
#  database_version     = "MYSQL_8_0"
#  tier                 =  "db-custom-2-3840"
#  disk_size            = "10"
#  disk_type            = "PD_SSD"
# #Sql database
#  name                 = "rltc-incometax"
#  db_user              = "tst"
#  db_password          = "Tc@321"
#  project_database     = "tc-terraform-test"
#}
#module "tc-matrix" {
#  source  = "app.terraform.io/TradersClub/sql/google"
#  version = "4.0.2"
# # Instance Sql
#  project              = "tc-terraform-test"
#  database_name        = "elliasadasx"
#  region               = "us-central1"
#  database_version     = "MYSQL_5_7"
#  tier                 =  "db-custom-1-3840"
#  disk_size            = "30"
#  disk_type            = "PD_SSD"
# #Sql database
#  name                 = "rltc-matrix"
#  db_user              = "tst"
#  db_password          = "Tc@321"
#  project_database     = "tc-terraform-test"
#}
#module "tc-matrixwallet-bd" {
#  source  = "app.terraform.io/TradersClub/sql/google"
#  version = "4.0.2"
# # Instance Sql
#  project              = "tc-terraform-test"
#  database_name        = "ellxwallet-bd"
#  region               = "us-central1"
#  database_version     = "MYSQL_8_0"
#  tier                 =  "db-custom-2-3840"
#  disk_size            = "10"
#  disk_type            = "PD_SSD"
# #Sql database
#  name                 = "rltc-matrixwallet-bd"
#  db_user              = "tst"
#  db_password          = "Tc@321"
#  project_database     = "tc-terraform-test"
#}
#module "tc-portfolioapi" {
#  source  = "app.terraform.io/TradersClub/sql/google"
#  version = "4.0.2"
# # Instance Sql
#  project              = "tc-terraform-test"
#  database_name        = "elltfolioapi"
#  region               = "us-central1"
#  database_version     = "MYSQL_5_7"
#  tier                 =  "db-custom-1-3840"
#  disk_size            = "50"
#  disk_type            = "PD_SSD"
# #Sql database
#  name                 = "rltc-portfolioapi"
#  db_user              = "tst"
#  db_password          = "Tc@321"
#  project_database     = "tc-terraform-test"
#}
#module "tc-premium" {
#  source  = "app.terraform.io/TradersClub/sql/google"
#  version = "4.0.2"
# # Instance Sql
#  project              = "tc-terraform-test"
#  database_name        = "ellljhmium"
#  region               = "us-central1"
#  database_version     = "MYSQL_5_7"
#  tier                 =  "db-custom-1-3840"
#  disk_size            = "100"
#  disk_type            = "PD_SSD"
# #Sql database
#  name                 = "rltc-premium"
#  db_user              = "tst"
#  db_password          = "Tc@321"
#  project_database     = "tc-terraform-test"
#}
#module "tc-school" {
#  source  = "app.terraform.io/TradersClub/sql/google"
#  version = "4.0.2"
# # Instance Sql
#  project              = "tc-terraform-test"
#  database_name        = "ellljhool"
#  region               = "us-central1"
#  database_version     = "MYSQL_5_7"
#  tier                 =  "db-custom-1-3840"
#  disk_size            = "50"
#  disk_type            = "PD_SSD"
# #Sql database
#  name                 = "rltc-school"
#  db_user              = "tst"
#  db_password          = "Tc@321"
#  project_database     = "tc-terraform-test"
#}
#module "tc-tournaments-new" {
#  source  = "app.terraform.io/TradersClub/sql/google"
#  version = "4.0.2"
# # Instance Sql
#  project              = "tc-terraform-test"
#  database_name        = "ellljhrnaments-new"
#  region               = "us-central1"
#  database_version     = "MYSQL_8_0"
#  tier                 =  "db-custom-1-3840"
#  disk_size            = "10"
#  disk_type            = "PD_SSD"
# #Sql database
#  name                 = "rltc-tournaments-new"
#  db_user              = "tst"
#  db_password          = "Tc@321"
#  project_database     = "tc-terraform-test"
#}
#module "tcnotification-history" {
#  source  = "app.terraform.io/TradersClub/sql/google"
#  version = "4.0.2"
# # Instance Sql
#  project              = "tc-terraform-test"
#  database_name        = "ellation-history"
#  region               = "us-central1"
#  database_version     = "MYSQL_8_0"
#  tier                 =  "db-custom-4-3840"
#  disk_size            = "50"
#  disk_type            = "PD_SSD"
# #Sql database
#  name                 = "rltcnotification-history"
#  db_user              = "tst"
#  db_password          = "Tc@321"
#  project_database     = "tc-terraform-test"
#}
#
