# Pré requisitos
Para uma execução fluida do curso recomendamos o uso de [S.O. Ubuntu Linux](https://ubuntu.com/download/desktop), que é distribuição muito popular e de fácil configuração e utilização. Como ambiente de Cloud utilizaremos o [Microsoft Azure](https://azure.microsoft.com/pt-br/), então você precisará criar uma conta, além das seguintes **ferramentas**:

- [git](https://git-scm.com/)
- [aspnetcode-5.0](https://docs.microsoft.com/pt-br/aspnet/core/?view=aspnetcore-5.0)
- [vscode](https://code.visualstudio.com/)
- [postgresql](https://www.postgresql.org/)
- [dbeaver](https://dbeaver.io/download/)
- [azure-cli](https://docs.microsoft.com/pt-br/cli/azure/install-azure-cli)
- [terraform](https://www.terraform.io/)
- [ansible](https://www.ansible.com/)

---
# Configurando o ambiente

### Git
No terminal execute os seguintes comandos:

    sudo apt install git-all
    git config --global user.name "Seu Nome"
    git config --global user.email seu-email@spycode.io
    ssh-keygen -t rsa -C "seu-email@spycode.io"

### ASP.Net Core
No terminal execute os seguintes comandos:


    wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb
    rm packages-microsoft-prod.deb
    sudo apt update && sudo apt install y apt-transport-https && sudo apt update && sudo apt install -y dotnet-sdk-5.0

---
# Configurando o ambiente

### VS Code
Acesse a página [https://code.visualstudio.com/](https://code.visualstudio.com/#) e faça o download do pacote de instalação .deb

No terminal execute os seguintes comandos na pasta do download:

    sudo dpkg -i code_1.59.0-1628120042_amd64.deb
    rm code_1.59.0-1628120042_amd64.deb

### PostgreSQL
No terminal execute os seguintes comandos:

    sudo apt install postgresql postgresql-contrib
    sudo -u postgres psql
    postgres=# ALTER USER postgres PASSWORD 'postgres';
    postgres=# \q;

---
# Configurando o ambiente

### DBEaver
Acesse a página [https://dbeaver.io/download/](https://dbeaver.io/download/) e faça o download do pacote .net Community Edition

    sudo dpkg -i dbeaver-ce_21.1.4_amd64.deb
    rm dbeaver-ce_21.1.4_amd64.deb

### Azure cli
No terminal execute os seguintes comandos:

    sudo apt install ca-certificates curl apt-transport-https lsb-release gnupg
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

---
# Configurando o ambiente

### Terraform
No terminal execute os seguintes comandos:

    curl https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_linux_amd64.zip --output terraform_1.0.4_linux_amd64.zip
    unzip terraform_1.0.4_linux_amd64.zip
    sudo mv terraform /usr/local/bin

### Ansible
No terminal execute os seguintes comandos:

    sudo apt install ansible


    

