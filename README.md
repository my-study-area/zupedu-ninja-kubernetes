# zupedu-ninja-kubernetes

## Bem Vindos(as)

### Informações importante sobre a organização deste treinamento
### Preparo para ser um(a) melhor estudante
- [Autodidata em Tecnologia: Dicas de como estudar melhor com Alberto Souza | ⚡ Zup Insights](https://www.youtube.com/watch?v=06DmQMNKi7M&ab_channel=ZUP)
- [Pirâmide de testes do aprendizado](https://www.youtube.com/watch?v=nC5hlhlZGk0&ab_channel=DevEficiente)

## Curso: Fundamentos sobre Terraform
1.1 Questionário inicial

1.2 O que é Terraform? [Teoria]
- [https://www.youtube.com/watch?v=YQ7gLMxCDGk&ab_channel=4Zuppers](https://www.youtube.com/watch?v=YQ7gLMxCDGk&ab_channel=4Zuppers)
- [Site Terraform](https://www.terraform.io/)

1.3 Instalando o Terraform
- [Instalando o Terraform [Teoria]](https://www.youtube.com/watch?v=FSUUmjJSw6w&ab_channel=4Zuppers)
- [Download Terraform](https://www.terraform.io/downloads.html)

Após o download, execute:
```bash
# descompacta o binário
unzip terraform_1.1.6_linux_amd64.zip

# adiciona permissão de execução e move para /usr/local/bin/
chmod +x terraform ; sudo mv terraform /usr/local/bin/

# verifica versão do terraform
terraform -version
```
1.4 Tfenv
- [Tfenv [Teoria]](https://www.youtube.com/watch?v=gImQgzTuwUY&ab_channel=4Zuppers)
- [Github tfenv](https://github.com/tfutils/tfenv)
```bash
# adiciona o diretório do tfenv no path para o fish shell
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.config/fish/config.fish

# aplica a atualização realizada na configuração do fish
source  ~/.config/fish/config.fish

# verifica versão
tfenv --version

# lista as versões instaladas
tfenv list

# lista as versẽos remotas
tfenv list-remote

# instala 
tfenv install 0.15.5

# utiliza uma versão específica
tfenv use 0.15.5
```
1.5 Hashcorp Configuration Language
- [Hashcorp Configuration Language [Teoria]](https://www.youtube.com/watch?v=c0AN60HIUVs&ab_channel=4Zuppers)
- [Terraform Configuration Syntax](https://www.terraform.io/docs/language/syntax/configuration.html)
- Arguments
- Blocks
- Identifiers
- Comments

1.6 Providers
- [Providers [Teoria]](https://www.youtube.com/watch?v=TQy5nOfKzFw&ab_channel=4Zuppers)
- [Providers](https://www.terraform.io/language/providers)
- [AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

1.7 Workflow
- [Workflow [Teoria]](https://www.youtube.com/watch?v=5XWpJl-MD0Q&ab_channel=4Zuppers)
- [The Core Terraform Workflow](https://www.terraform.io/intro/core-workflow)

1.8 Variáveis
- [Variáveis [Teoria]](https://www.youtube.com/watch?v=C5heMaYkx5w&ab_channel=4Zuppers)
- [Input Variables](https://www.terraform.io/language/values/variables)
- as variáveis tem uma precedência que é:
  - variáveis de ambiente
  - arquivo terraform.tfvars
  - arquivo terraform.tfvars.json 
  - `*.auto.tfvars` ou `*.auto.tfvars.json`
  - `-var` e `-var-file` da linha da comando
- exemplo de variável na linha de comando: `terraform plan -var="instance_type=t2-micro"`

1.9 Interpolação
- [Interpolação [Teoria]](https://www.youtube.com/watch?v=sRQj46yE3VQ&ab_channel=4Zuppers)
- [»Interpolation Syntax](https://www.terraform.io/language/configuration-0-11/interpolation)
- [random_string (Resource)](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)

1.10 Terraform Console e Outputs
- [Terraform Console e Outputs [Teoria]](https://www.youtube.com/watch?v=TzPjrxxadA4&ab_channel=4Zuppers)
- [Command: console](https://www.terraform.io/cli/commands/console)
- [Output Values](https://www.terraform.io/language/values/outputs)
```bash
# gerencia o state file do projeto, mas no nosso caso estamos 
# consultando os nossos recursos
terraform state list

# entra no console
terraform console

# dentro do console, lista as informações do recurso
aws_instance.curso-terraform

# uma das opções para carregar as modificações adicionadas
# através da adição de um output
terraform apply --auto-approve
```

1.11 Locals
- [Locals [Teoria]](https://www.youtube.com/watch?v=vrLjIANhsYo&ab_channel=4Zuppers)
- No uso `Input Variables`, não podemos utilizar uma variável dentro de outra variável, neste caso utilizamos `Local Values`
- [Local Values](https://www.terraform.io/language/values/locals)
- [The count Meta-Argument](https://www.terraform.io/language/meta-arguments/count)
- O meta argumento `count` é usado em módulos e recursos, por exemplo, na criação de instâncias. Nos blocos de código que adicionamos o `count` temos acesso ao index de cada instância criada.
```bash
resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}
```
- [Splat Expressions](https://www.terraform.io/language/expressions/splat)
- `Splat Expressions` são utilizadas no output quando temos mais de uma instânica criada. Nos exemplos anteriores, somente foi utilizado uma instância e quando temos mais de uma instância não é possível identificar qual instância está sendo referenciada no output. Para resolver este problema utilizamos a Splat Expressions. Ex:
```bash
# antes
output "instance_p_addr" {
  value = aws_instance.curso-terraform.public_ip
}

#depois
output "instance_p_addr" {
  value = aws_instance.curso-terraform.*.public_ip
}
```

1.12 State e Remote State
- [State e Remote State [Teoria]](https://www.youtube.com/watch?v=_nWsEkxhFgk&ab_channel=4Zuppers)
- [State](https://www.terraform.io/language/state)
- [Remote State](https://www.terraform.io/language/state/remote)
- [Backends](https://www.terraform.io/language/settings/backends)
- Nunca salve o arquivo tfstate no controle de versão, possui informações sensíveis que podem ser utilizadas por um atacante

1.13 Count
- [Count [Teoria]](https://www.youtube.com/watch?v=JyfjC9Q433I&ab_channel=4Zuppers)
- [The count Meta-Argument](https://www.terraform.io/language/meta-arguments/count)
```bash
resource "aws_instance" "server" {
  count = 4 # create four similar EC2 instances

  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"

  tags = {
    Name = "Server ${count.index}"
  }
}
```

1.14 For Each
- [For Each [Teoria]](https://www.youtube.com/watch?v=CPdBPwb6NuU&ab_channel=4Zuppers)
- [The for_each Meta-Argument](https://www.terraform.io/language/meta-arguments/for_each)

1.15 Built in Functions
- [Built in Functions [Teoria]](https://www.youtube.com/watch?v=Ca_8OyDXQp8&ab_channel=4Zuppers)
- [Built-in Functions](https://www.terraform.io/language/functions)
- [lookup Function](https://www.terraform.io/language/functions/lookup)
- [merge Function](https://www.terraform.io/language/functions/merge)
- [join Function](https://www.terraform.io/language/functions/join)

1.16 Data Sources
- [Data Soource](https://www.terraform.io/language/data-sources)
- [Data Sources [Teoria]](https://www.youtube.com/watch?v=Ykx6QlVk_3A&ab_channel=4Zuppers)
- [Data Source: aws_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)
- [Data Source](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http)
```json
data "aws_ami" "amazon-linux" {
  owners = ["amazon"]
  # owners = ["*"]
  most_recent = true
  filter {
    name = "name"

    values = [
      # "amzn2-ami-hvn-2.0*-x86_64-gp2"
      "Windows*"
    ]
  }
}
```
Filtro equivalente realizado via linha de comando:
```bash
#
aws ec2 describe-images \
  --endpoint-url=http://localhost:4566 \
  --owners "amazon" \
  --filters="Name=name,Values=Windows*" | jq
```

```json
resource "aws_security_group_rule" "sg-curso-terraform" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = [ "${chomp(data.http.myip.body)}/32"]
  security_group_id = "sg-d92a9f2e13def8968"
}
```
Comando utilizado para criar e ter acesso ao security_group_id
```bash
# cria um security_group
aws ec2 create-security-group \
  --endpoint-url http://localhost:4566 \
  --group-name SSHAccess \
  --description "Security group for SSH access" \
  --vpc-id vpc-6674dfc5

aws ec2 describe-security-groups \
  --endpoint-url http://localhost:4566 | jq

```

1.17 Workspaces
- [Workspaces [Teoria]](https://www.youtube.com/watch?v=unHljv1Pb6g&ab_channel=4Zuppers)
- [Workspaces](https://www.terraform.io/language/state/workspaces)
```bash
# lista os workspaces
terraform workspace list

# mostra o nome do workspace atual
terraform workspace show

# cria um workspace
terraform workspace new <WORSPACE_NAME>

# seleciona um workspace
terraform workspace select <WORSPACE_NAME>
```

## Comandos
```bash
# 
terraform init

#
terraform plan

#
terraform apply

#
terraform plan -out="plan.out"

#
terraform validate

#
terraform fmt

#
terraform destroy

# 
terraform plan -var="instance_type=t2-micro"

# mostra o estado atual ou salvo no plan
terraform show

# lista as instâncias
aws ec2 describe-instances \
  --endpoint-url http://localhost:4566

# lista as instância exibindo o nome e a Tag
aws ec2 describe-instances \
  --endpoint-url http://localhost:4566 \
  --query "Reservations[*].Instances[*].\
  {State:State.Name,Tag:Tags[*].Value}[]"

# verifica o bucket criado no localstack
aws s3api list-buckets --query "Buckets[].Name" \
  --endpoint-url=http://localhost:4566

# lista as instâncias filtrando com status running
# e exibindo o campo State e InstanceId
aws ec2 describe-instances \
  --endpoint-url http://localhost:4566 \
  --query "Reservations[*].Instances[*].{State:State.Name,InstanceId:InstanceId}" \
  --filters "Name=instance-state-name,Values=running" | jq

#
aws ec2 describe-images \
  --endpoint-url=http://localhost:4566 \
  --query="Images[*].{ImageId:ImageId,OwnerId:OwnerId}" | jq

#
aws ec2 describe-images \
  --endpoint-url=http://localhost:4566 \
  --query="Images[*].{ImageId:ImageId,OwnerId:OwnerId}" \
  --filters="Name=owner-id,Values=801119661308" | jq

```

# Links
- [HashCorp Learn](https://learn.hashicorp.com/terraform)
- [Localstack configuration from Terraform documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/custom-service-endpoints#localstack)
