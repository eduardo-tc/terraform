<div align="center">
<img src="https://user-images.githubusercontent.com/92866437/139257288-63158eae-6f1f-49a1-a0f5-5f15a8442e5c.png" width="250px" />
</div>

 tc-terraform-test

> **_Modulo para provisionamento de VM_** 

___
 
 __Arquivo compute.tf__

[Referência](https://www.terraform.io/docs/language/modules/sources.html)

 Para módulos hospedados em outros registros, prefixe o endereço de origem com uma <HOSTNAME>/parte adicional , fornecendo o nome do host do registro privado:

```
module "compute" {
  source = "app.terraform.io/TradersClub/compute/google"
  version = "0.0.1"
}

```
 Se você estiver usando a versão SaaS do Terraform Cloud, seu nome de host de registro privado é app.terraform.io

 * Compute VM

```
project              = "tc-terraform-test"
compute-name         = "teste-vm"
machine-type         = "n1-standard-1"
region               = "us-central1"
instance-count       = "1"
disk-size            = "20"
disk-type            = "pd-ssd" 
network              = "vpc-tst-global"
subnetwork           = "subnet-tst-central1"  
depends_on           = [module.network] 

```
 > **_Referência de Atributos_** 

 [Referência Inputs](https://registry.terraform.io/modules/terraform-google-modules/container-vm/google/latest/submodules/cos-generic)
 [Referência](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started)
 [Referência 1](https://www.terraform.io/docs/language/meta-arguments/depends_on.html)
 [Referência 2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork)

 * `project` É campo deve ser o ID do seu projeto pessoal. O `project` indica o projeto GCP padrão em que todos os seus recursos serão criados. A maioria dos recursos do Terraform terá um `project` campo.

 * `region` e `zone` São os locais onde seus recursos serão criados.
 
 * `machine-type` Indica a familia da instancia.

 * `instance-count` Número de instâncias a serem criadas.

 * `disk-size` Indica o tamanho do disco. 

 * `disk-type` Indica o tipo de disco.
 
 * `network` Cria uma nova vpc. (Obrigatório) A rede à qual esta sub-rede pertence. Apenas as redes que estão no modo distribuído podem ter sub-redes.

 * `subnetwork` Cria uma nova subnet.

 * `depends_on` meta-argumento para lidar com recursos ocultos ou dependências de módulo que o Terraform não pode inferir automaticamente. Especificar explicitamente uma dependência só é necessário quando um recurso ou módulo depende do comportamento de algum outro recurso, mas não acessa nenhum dos dados desse recurso em seus argumentos.
 Referência de Atributos 
___
 __Arquivo network.tf__

 [Referência](https://registry.terraform.io/namespaces/terraform-google-modules) 
 [Referência 1](https://registry.terraform.io/modules/terraform-google-modules/network/google/latest)
 [Referência 2](https://registry.terraform.io/modules/terraform-google-modules/network/google/latest/submodules/subnets)
 [Referência 3](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network)
 [Referência 4](https://registry.terraform.io/modules/nephosolutions/network/google/latest/examples/secondary_ranges)
 [Referência 5](https://github.com/terraform-google-modules/terraform-google-network)
 
```
module "network" {
  source  = "app.terraform.io/TradersClub/network/google"
  version = "0.0.8"
   insert required variables here
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

```
__Terraform Subnets Module__

_Subnet Inputs_

A lista de sub-redes contém mapas, onde cada objeto representa uma sub-rede. Cada mapa possui as seguintes entradas.

Este submódulo faz parte do `terraform-google-network` módulo. Ele cria as sub-redes vpc individuais.

* `network_name` O nome da rede VPC que esta sendo criada e aonde as sub-redes serão criadas.

* `project_id` O ID do projeto onde as sub-redes serão criadas.

* `subnets` A lista de sub-redes sendo criadas.

* `routing_mode` (Opcional) O modo de roteamento de toda a rede a ser usado. Se definido como `REGIONAL` , os roteadores em nuvem desta rede anunciarão apenas rotas com sub-redes desta rede na mesma região do roteador. Se definido como `GLOBAL` , os roteadores de nuvem desta rede anunciarão rotas com todas as sub-redes desta rede, entre as regiões. Os valores possíveis são `REGIONAL` e `GLOBAL`.

[Referência ](https://registry.terraform.io/modules/terraform-google-modules/network/google/latest)

```
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

```

* `secondary_ranges` Intervalos secundários que serão usados ​​em algumas das sub-redes.

* `subnet` A lista de sub-redes sendo criadas.

_Route Inputs_

A lista de rotas contém mapas, onde cada objeto representa uma rota. Para as entradas next_hop_ *, apenas uma pode ser usada em cada rota. Ter duas entradas next_hop_ * produzirá um erro. Cada mapa possui as seguintes entradas.

```
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

```

* `name` O nome da rota que está sendo criada.

* `description` A descrição da rota que está sendo criada.

* `tags` As marcas de rede atribuídas a esta rota. Esta é uma lista em formato de string. Por exemplo. "tag-01, tag-02".

* `next_hop_internet` Se o próximo salto para esta rota será o gateway de Internet padrão. Use "true" para habilitar isso como próximo salto.

* `routes` Lista de rotas sendo criadas neste VPC.

* `destination_range` O intervalo de destino dos pacotes de saída aos quais esta rota se aplica. Apenas IPv4 é compatível.

___

__Arquivo function.tf__

[Referência](https://registry.terraform.io/modules/terraform-google-modules/event-function/google/latest/submodules/repository-function)
[Referência 1](https://github.com/terraform-google-modules/terraform-google-event-function)
[Referência 2](https://registry.terraform.io/modules/fuzzylabs/cloud-function/google/latest/examples/simple_example)
[Referência 3](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudfunctions_function)

```
module "function" {
  source  = "app.terraform.io/TradersClub/function/google"
  version = "0.0.1"
  Function
  project                       = "tc-terraform-test"
  region                        = "us-central1"
  name                          = "tc-fun-testing"
  description                   = "Para testes"
  runtime                       = "nodejs10"
  available_memory_mb           = "128"
  timeout                       = "90"
  max_instances                 = "0"
  trigger_http                  = "true"
  entry_point                   = "helloWorld"
  ingress_settings              = "ALLOW_ALL"
  vpc_connector                 = "projects/tc-terraform-test/locations/us-central1/connectors/tst-connetor-24-08"
  vpc_connector_egress_settings = "ALL_TRAFFIC"
}

```
* `project` = `project_id` O ID do projeto ao qual os recursos serão aplicados.                    
* `region` A região na qual os recursos serão aplicados.                    
* `name` O nome a ser aplicado a todos os recursos que podem ser nomeados.      
* `description` A descrição da função.                  
* `runtime` O tempo de execução em que a função será executada.                     
* `available_memory_mb` A quantidade de memória em megabytes alocada para a função usar.          
* `timeout` A quantidade de tempo em segundos alocada para a execução da função.                      
* `max_instances` O número máximo de execuções paralelas da função.                
* `trigger_http` Se usar o gatilho HTTP em vez do gatilho de evento                
* `entry_point` O nome de um método na origem da função que será invocado quando a função for executada.                  
* `ingress_settings` As configurações de entrada para a função. Os valores permitidos são ALLOW_ALL, ALLOW_INTERNAL_AND_GCLB e ALLOW_INTERNAL_ONLY. As alterações neste campo recriarão a função da nuvem.             
* `vpc_connector` O conector de rede VPC ao qual esta função de nuvem pode se conectar. Deve ser configurado como URI totalmente qualificado. O formato deste campo é projects / * / locations / * / connectors / *.                
* `vpc_connector_egress_settings` As configurações de saída do conector, controlando qual tráfego é desviado por ele. Os valores permitidos são ALL_TRAFFIC e PRIVATE_RANGES_ONLY. Se não for definido, este campo preserva o valor definido anteriormente.

___

__Arquivo gke-tsf.tf__

[Referência](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest)
[Referência 2](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest/submodules/hub)
[Referência 3](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster)
[Referência 4](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest)

```
module "gke" {
  source  = "app.terraform.io/TradersClub/gke/google"
  version = "0.0.1"
  cluster_name                  = "tst"
  project_id                    = "tc-terraform-test"
  location                      = "us-central1"
  min_master_version            = "latest"
  network                       = "vpc-tst-global"
  subnetwork                    = "subnet-tst-central1"
  cluster_secondary_range_name  = "subnet-secondary-gke-pods-tst-us-central1"
  services_secondary_range_name = "subnet-secondary-gke-services-tst-us-central1"  

```

* `source`  Apontamento local ou remoto do seu projeto.
* `version` A versão do Kubernetes para os nós neste pool. Só deve ser definido se auto_upgrade for falso.
* `cluster_name` O nome exclusivo para identificar o cluster no ASM.                
* `project_id`  O projeto ao qual o recurso pertence.                  
* `location` 	Localização do cluster (região se cluster regional, zona se cluster zonal).                     
* `min_master_version` Versão mínima do kubernetes mestre.          
* `network` A rede VPC para hospedar o cluster (obrigatório).                     
* `subnetwork` A sub-rede para hospedar o cluster (obrigatório).                   
* `cluster_secondary_range_name` (Opcional) O nome do intervalo secundário existente. 
* `services_secondary_range_name` (Opcional) O nome do intervalo secundário existente na sub-rede do cluster a ser usado para `ClusterIPs` de serviço . Como alternativa, `services_ipv4_cidr_blockpode` ser usado para criar automaticamente um gerenciado pelo GKE.

```
/**************************
   Nodepool
   **************************/

    nodepools = [
      {
          nodepool_name         = "np-tst"
          nodepool_location     = "us-central1"
          initial_node_count    = 3
          version               = "latest"
          min_node_count        = 1
          max_node_count        = 5
          preemptible           = false
          machine_type          = "e2-medium"
      },
      {
          nodepool_name         = "np-tst2"
          nodepool_location     = "us-central1"
          initial_node_count    = 3
          version               = "latest"
          min_node_count        = 1
          max_node_count        = 5
          preemptible           = false
          machine_type          = "e2-medium"
      },

  ]
    node_locations = [
    "us-central1-c"
    "us-central1-a"
  ]
  service_account     = "nodepool@tc-terraform-test.iam.gserviceaccount.com"
  depends_on   = [module.network, module.service-account]
}

```
__Nodepool__

[Referência](https://cloud.google.com/kubernetes-engine/docs/concepts/node-pools)
[Referência 2](https://github.com/terraform-google-modules/terraform-google-kubernetes-engine)
[Referência 3](https://github.com/nlamirault/terraform-google-gke)
[Referência 4](https://registry.terraform.io/modules/terraform-google-modules/kubernetes-engine/google/latest)
[Referência 5](https://github.com/terraform-google-modules/terraform-google-kubernetes-engine)
[Referência 6](https://github.com/gruntwork-io/terraform-google-gke)

Pools de nós personalizados são úteis quando você precisa agendar pods que exigem mais recursos do que outros, como mais memória ou mais espaço em disco local. Se precisar de mais controle de onde os pods são programados, você pode usar manchas de nó .

Você pode criar, atualizar e excluir pools de nós individualmente sem afetar todo o cluster. Você não pode configurar um único nó em um pool de nós; quaisquer alterações de configuração afetam todos os nós no pool de nós.

* `nodepools`  ou `node_pools` Lista de mapas contendo pools de nós.
* `nodepool_name` ou `node_pools_names`  Lista de nomes de pools de nós.        
* `nodepool_location` ou `node_locations` A lista de zonas nas quais os nós do cluster estão localizados. Os nós devem estar na região de seu cluster regional ou na mesma região que a zona de seu cluster para clusters zonais. O padrão é a localização dos nós em nível de cluster se nada for especificado.     
* `initial_node_count` O número de nós a serem criados no pool de nós padrão deste cluster.   
* `version` Versão Utilizada.              
* `min_node_count` Minimo de Pools de nós de complementos.       
* `max_node_count` Maximo de Pools de nós de complementos.       
* `preemptible` Um booleano que representa se as VMs do nó subjacente são preemptivas.          
* `machine_type` O nome de um tipo de máquina do Google Compute Engine.    
* `node_locations` A conta de serviço a ser usada pelas VMs do Node.
* `service_account` A conta de serviço para executar nós como se não fosse substituída `node_pools`. O valor padrão da variável create_service_account (true) fará com que uma conta de serviço específica do cluster seja criada.
* `depends_on` meta-argumento para lidar com recursos ocultos ou dependências de módulo que o Terraform não pode inferir automaticamente. Especificar explicitamente uma dependência só é necessário quando um recurso ou módulo depende do comportamento de algum outro recurso, mas não acessa nenhum dos dados desse recurso em seus argumentos.
 Referência de Atributos.

___

__Arquivo sql.tf__ 

[Referência](https://registry.terraform.io/modules/GoogleCloudPlatform/sql-db/google/latest)
[Referência 2](https://github.com/terraform-google-modules/terraform-google-sql-db)
[Referência 3](https://github.com/hashicorp/terraform-google-terraform-enterprise/blob/main/variables.tf)
[Referência 4](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/database_user)
[Referência 5](https://github.com/hashicorp/terraform-provider-google/issues/6380)
[Referência 6](https://cloud.google.com/sql/docs/mysql/instance-settings)
[Referência 7](https://registry.terraform.io/modules/jhagdu/wp-infrastructure/gcp/latest?tab=inputs)
[Referência 8](https://github.com/terraform-google-modules/terraform-google-sql-db/tree/master/modules/mysql)
```
module "preprod-tcserver" {
  source  = "app.terraform.io/TradersClub/sql/google"
  version = "4.0.4"
# Instance Sql
  project              = "tc-terraform-test"
  database_name        = "tcserver-a"
  region               = "us-central1"
  database_version     = "MYSQL_5_7"
  tier                 =  "db-custom-8-30720"
  disk_size            = "274"
  disk_type            = "PD_SSD"
# Sql database
  name                 = "preprod-tcserver-a"
  db_user              = "tst"
  db_password          = "Tc@321"
  project_database     = "tc-terraform-test"
}

```

* `source` Apontamento local ou remoto do seu projeto. 
* `version` Versão do modulo sql.
<<<<<<< HEAD
__Instance Sql__

* `project` ou `project_id` O ID do projeto para gerenciar os recursos do Cloud SQL.             
* `database_name` (Obrigatório) Banco de dados no qual o usuário tem a função.      
* `region` A região dos recursos do Cloud SQL.             
* `database_version` A versão do banco de dados a ser usada.    
* `tier` o nome do tipo de máquina legado (usado anteriormente no Console do Cloud) é mapeado para sua string equivalente no formato db-custom-_CPU _-_ RAM_.               
* `disk_size` O tamanho do disco para a instância mestre.          
* `disk_type` O tipo de disco da instância mestre. 
__Sql database__

* `name` ou `db_name` O nome do banco de dados padrão a ser criado.                
* `db_user` Nome de usuário do banco de dados SQL             
* `db_password` ou `user_password` random one will be generated and available in the generated_user_password output variable.       
* `project_database` O nome do projeto que sera criado e alocado o recurso.   

___

__Arquivo storage.tf__

[]()
[]()
[]()
[]()

```
module "storage" {
  source  = "app.terraform.io/TradersClub/storage/google"
  version = "0.0.1"
# # insert required variables here
  project_id  = "tc-terraform-test"
  names = ["tst1", "tst2", "tst3"]
  prefix = "tc-storage"
  set_admin_roles = true
  versioning = {
    tst1 = true
  }
  bucket_admins = {
    tst2 = "serviceAccount:nodepool@tc-terraform-test.iam.gserviceaccount.com"
  }
  depends_on   = [module.service-account]
}
```
* `source` Apontamento local ou remoto do seu projeto. 
* `version` Versão do modulo storage.
* `project` ou `project_id` O ID do projeto para gerenciar os recursos do Storage.
* names
* prefix
* set_admin_roles
* versioning
* bucket_admins
