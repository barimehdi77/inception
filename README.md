# 🤔 Description

This project consists in having you set up a small infrastructure composed of different
services under specific rules. The whole project has to be done in a virtual machine. You
have to use docker-compose.

<img width="1138" alt="Screen Shot 2021-12-22 at 8 41 27 PM" src="https://user-images.githubusercontent.com/54292953/147146640-ae6e8f26-3332-474a-bc43-be556dd61c66.png">


# <img src="https://www.docker.com/sites/default/files/d8/2019-07/vertical-logo-monochromatic.png"  width="40px"> Inception

## Mandatory part

Each Docker image must have the same name as its corresponding service.
Each service has to run in a dedicated container:
  You then have to set up:
  - A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
  - A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
  - A Docker container that contains MariaDB only without nginx.
  - A volume that contains your WordPress database.
  - A second volume that contains your WordPress website files.
  - A docker-network that establishes the connection between your containers.
  - Your containers have to restart in case of a crash.

Here is an example diagram of the expected result:

<img width="562" alt="Screen Shot 2021-12-22 at 8 38 03 PM" src="https://user-images.githubusercontent.com/54292953/147146268-a616f39a-3f16-41f8-80c9-db5494c3dfe7.png">

## Bonus part

For this project, the bonus part is aimed to be simple.
A Dockerfile must be written for each extra service. Thus, each one of them will run
inside its own container and will have, if necessary, its dedicated volume.

Bonus list:
   - Set up redis cache for your WordPress website in order to properly manage the
cache.
   - Set up a FTP server container pointing to the volume of your WordPress website.
   - Create a simple static website in the language of your choice except PHP (Yes, PHP
is excluded!). For example, a showcase site or a site for presenting your resume.
   - Set up Adminer.
   - Set up a service of your choice that you think is useful. During the defense, you
will have to justify your choice.


# ⚙️ Start Containers

You can run:
  - `make` in the root of the directory to build and start all container

  - `make ls` to list all the images and containers

  - `make status` to see the running containers

  - `make build` to build all images in docker-compose

  - `make up` to start all containers in docker-compose

  - `make logs` to see the logs of the containers

  - `make stop` to stop all containers in the docker-compose

  - `make start` to start all containers in the docker-compose

  - `make down` to remove all containers in the docker-compose

  - `make reload` to remove, build and run all containers in docker-compose

  - `make rm` **NOTE** This command will remove **ALL CONTAINERS IN YOUR OPERATOR SYSTEM**.

  - `make rvolumes` to delete all volumes folders from your system

  - `make volumes` to create folders of the volumes in your system.



# 👨‍💻 Ressources
 - [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)
 - [Install Docker Compose on Ubuntu](https://docs.docker.com/compose/install/)
 - [Compose file version 3 reference](https://docs.docker.com/compose/compose-file/compose-file-v3/)
 - [WordPress Deployment with NGINX, PHP-FPM and MariaDB using Docker Compose](https://medium.com/swlh/wordpress-deployment-with-nginx-php-fpm-and-mariadb-using-docker-compose-55f59e5c1a)
 - [How To Configure Nginx to use TLS 1.2 / 1.3 only](https://www.cyberciti.biz/faq/configure-nginx-to-use-only-tls-1-2-and-1-3/)
 -  [php-fpm  Configuration](https://www.php.net/manual/en/install.fpm.configuration.php)
 - [Exporting/Backing up Database](https://wordpress.org/support/article/backing-up-your-database/)
 - [alpine os releases](https://www.alpinelinux.org/releases/)
 - [adminer download](https://www.adminer.org/#download)
 - [php built-in web server](https://www.php.net/manual/en/features.commandline.webserver.php)

---

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/barimehdi77)
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/K3K45UOA7)
[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://paypal.me/barimehdi77)
