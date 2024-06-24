# terraform-gen-ai-template
Repositório criado com o escopo básico para a criação de um template em um projeto GEN-AI.

O projeto atualmente está separado nos seguintes módulos e estrutura.

# 1 - BIG QUERY
Paramêtros necessários:
source       = "./modules/big_query"    #não há necessidade de alterar
project_id   = var.project_id           #id do projeto, deve ser passado via input
location     = var.location             #região onde o recurso será criado, deve ser passado via input
dataset_id   = "dataset_test"           #id do dataset do big query
view_id      = "view_test"              #id da view que será usada (revisar para ser opcional)
table_id     = "table_test"             #id da tabela do big query

# 2 - PUB/SUB & CLOUD FUNCTIONS
Paramêtros necessários:
source                = "./modules/pub_sub_cloud_functions"   #não há necessidade de alterar
project_id            = var.project_id                        #id do projeto, deve ser passado via input
location              = var.location                          #região onde o recurso será criado, deve ser passado via input
service_account       = ""
service_account_email = ""
bucket_name           = module.storage.bucket_name            #nome do bucket que será usado no projeto, o valor usado vem do módulo especifico para buckets
  
# 3 - SERVICE ACCOUNT
Paramêtros necessários:
source             = "./modules/service_account"   #não há necessidade de alterar
project_id         = var.project_id                #id do projeto, deve ser passado via input
service_account_id = "teste-id"                    #id da service account, deve ser passado via input

# 4 - STORAGE
Paramêtros necessários:
source       = "./modules/storage"   #não há necessidade de alterar
location     = var.location          #região onde o recurso será criado, deve ser passado via input
bucket_name  = "bucket_name"         #nome do bucket que será criado dentro do projeto
project_id   = var.project_id        #id do projeto, deve ser passado via input

# COMO CRIAR OS RECURSOS
Ao clonar o repositório, validar com os seguintes comandos

terraform-init
terraform-plan
# todo explicar como passar os parametros

# TODO
- explicar quais parametros dentro dos módulos precisam ser preenchidos
- revisar se é melhor separar pub/sub da cloud function, deixei tudo no mesmo módulo por enquanto
- separar o código em diferentes ambientes
