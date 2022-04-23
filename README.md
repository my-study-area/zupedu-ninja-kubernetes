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

# lista as instâncias
aws ec2 describe-instances \
  --endpoint-url http://localhost:4566

# lista as instância exibindo o nome e a Tag
aws ec2 describe-instances \
  --endpoint-url http://localhost:4566 \
  --query "Reservations[*].Instances[*].\
  {State:State.Name,Tag:Tags[*].Value}[]"
```
