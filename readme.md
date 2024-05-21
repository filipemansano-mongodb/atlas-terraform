# Terraform MongoDB Atlas Deployment
Este projeto utiliza Terraform para criar e gerenciar uma infraestrutura do MongoDB Atlas. A infraestrutura inclui a criação de um projeto, cluster, Private Link, políticas de backup e usuários de banco de dados.

## Pré-requisitos
- Terraform instalado na sua máquina local.
- Conta no MongoDB Atlas.
- API Key do MongoDB Atlas com permissões adequadas.

## Estrutura do Projeto
- project: Módulo para criar um projeto no MongoDB Atlas.
- cluster: Módulo para criar um cluster no MongoDB Atlas.
- network/private-link/aws: Módulo para configurar o Private Link na AWS.
- backup: Módulo para configurar políticas de backup.
- users: Módulo para criar usuários no MongoDB Atlas.

## Uso
### 1. Clone o repositório para sua máquina local.

```sh
git clone git@github.com:filipemansano-mongodb/atlas-terraform.git
```

### 2. Navegue até o diretório do projeto.

```sh
cd atlas-terraform
```

### 3. Crie um arquivo terraform.tfvars para definir as variáveis necessárias.
```hcl
public_key = <atlas-public-key>
private_key =<atlas-private-key>
org_id = <atlas-org-id>
aws_access_key = <aws-access-key>
aws_secret_key =  <aws-secret-key>
aws_region =  <aws-region>
users = [
  {
    username           = "<username>"
    password           = "<password>"
    roles = [
      {
        role_name     = "atlasAdmin"
        database_name = "admin"
      }
    ]
  },
  {
    username           = "<username>"
    password           = "<password>"
    roles = [
      {
        role_name     = "readWriteAnyDatabase"
        database_name = "admin"
      }
    ]
  }
]
```
### 4. Edite o arquivo main.tf
Edite o arquivo `main.tf` com as configurações desejadas

Cada módulo possui suas próprias variáveis. Consulte os arquivos de variáveis de cada módulo para todas as opções disponíveis:

- [project/variables.tf](project/variables.tf)
- [cluster/variables.tf](cluster/variables.tf)
- [network/private-link/aws/variables.tf](network/private-link/aws/variables.tf)
- [backup/variables.tf](backup/variables.tf)
- [users/variables.tf](users/variables.tf)

### 5. Execute os comandos do Terraform para inicializar, planejar e aplicar as mudanças.

```sh
terraform init
terraform plan
terraform apply
```

## References
- https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs
- https://github.com/mongodb/terraform-provider-mongodbatlas/tree/master/examples