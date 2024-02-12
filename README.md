# Nginx + PHP + MySql + MailHog + Redis + PHPCS
You need cloning the repository.
Access the folder .docker.

cd ~
mkdir Development
cd Development
git clone git@bitbucket.org:md-system-web/docker.git
Na pasta Development
É onde você vai clonar os projetos


```
Dentro da pasta Development
mkdir databases
chmod 0777 -R databases
mkdir .composer
chmod 0777 -R .composer
cd docker/
```

After, You need to create containers, below the code:
```
docker-composer up -d
```

You need to have in your computer **docker, and docker-composer**

You need to add config the your project in: **docker-m2/config/nginx/sites-enabled**

For exemplo remove in .sample: **docker-m2/config/nginx/sites-enabled/default_m2.conf**
```
server {
    server_name loja1.test;
    set $MAGE_MODE developer;
    set $MAGE_RUN_TYPE store;
    set $MAGE_ROOT /var/www/html/loja/;
    include /etc/nginx/includes/php81.conf;
}
```

Your projects must be at the same root as the docker-m2 folder.

For exemplo:
```
.
..
docker-m2
project-magento-2
```

# PHP Code Sniffer
We have two PHPCS. The phpcs56.sh and phpcs73.sh. To configure in vs code, below is cofiguration the file (.vscode/settings.json).

```
{
    "phpcs.executablePath": "/storage/.docker/php73cs.sh"
}
```

# XDebug
Use port 9001

# Executable PHP
docker-m2/php73.sh

# Acessar container mysql e php 74 ou 81
docker exec -it mysql bash
docker exec -it php74 bash
docker exec -it php81 bash

# Alguns comandos docker
docker-compose stop -> PARA TODOS OS CONTAINERS
docker-compose star -> START TODOS OS CONTAINERS
docker-compose down -> PARA E EXCLUIR TODOS OS CONTAINERS E PARA TODOS OS VOLUMES
docker-compose up -d -> CRIAR NOVOS CONTAINERS E VOLUMES CASO NÃO TIVER NENHUM CONTAINERS, E START