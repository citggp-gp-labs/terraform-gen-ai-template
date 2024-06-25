# terraform-gen-ai-template
Repositório criado com o escopo básico para a criação de um template em um projeto GEN-AI.

O projeto atualmente está separado nos seguintes módulos e estrutura.

## Big Query
Paramêtros necessários:
source       = "./modules/big_query"    #não há necessidade de alterar
project_id   = var.project_id           #id do projeto, deve ser passado via input
location     = var.location             #região onde o recurso será criado, deve ser passado via input
dataset_id   = "dataset_test"           #id do dataset do big query
view_id      = "view_test"              #id da view que será usada (revisar para ser opcional)
table_id     = "table_test"             #id da tabela do big query

## Pub/Sub Cloud Functions
Paramêtros necessários:
source                = "./modules/pub_sub_cloud_functions"     #não há necessidade de alterar
project_id            = var.project_id                          #id do projeto, deve ser passado via input
region                = var.region                              #região onde o recurso será criado, deve ser passado via input
service_account       = module.service_account.service_account  #id da service account, deve ser passado via input
bucket_name           = module.storage.bucket_name              #nome do bucket que será usado no projeto, o valor usado vem do módulo especifico para buckets

## Service Account
Paramêtros necessários:
source             = "./modules/service_account"   #não há necessidade de alterar
project_id         = var.project_id                #id do projeto, deve ser passado via input
service_account_id = "teste-id"                    #id da service account, deve ser passado via input

## Storage
Paramêtros necessários:
source       = "./modules/storage"   #não há necessidade de alterar
region       = var.region            #região onde o recurso será criado, deve ser passado via input
bucket_name  = "bucket_name"         #nome do bucket que será criado dentro do projeto
project_id   = var.project_id        #id do projeto, deve ser passado via input

## Clonando o repositório e verificando se está tudo ok
Ao clonar o repositório, validar com os seguintes comandos

´´´sh
terraform-init
terraform-plan
´´´

Os paramêtros necessários de cada projeto, precisam ser preenchido no arquivo terraform.tfvars. 

## Quais são os paramêtros?
project_id = O ID do seu projeto.
region = Em qual região os seus recursos deverão ser criados.
env = Ambiente de desenvolvimento. No momento serve apenas como uma tag para controle se é um recurso produtivo ou se é apenas para testes. Futuramente será evoluído para workspaces.

## Criando os recursos

´´´sh
terraform-apply
´´´
