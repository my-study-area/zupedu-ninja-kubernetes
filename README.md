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

