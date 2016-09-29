# docker_symfony

###Introduction
This is my docker project created for my symfony projects and all notes I have done by learning.
I use database localy so all database files are preserve on my computer not in image.

###Environment
I use MacBook Pro and tool "docker for Mac"(https://docs.docker.com/docker-for-mac/). If you use this tool you don't need to boot2docker and docker-machine because it use IOS environment natively.

###Basic concepts
* Image is just like template/formula of container 
* There is a loads of docker images you can use. You don’t have to build them from scratch.
* If you build your custom image you can push them to docker-hub (https://hub.docker.com/)
* Images can be inheritance
* All containers work in one network e.g. 172.18.0.0 and you can use alias instead of IP’s in your app

###Useful commands:

####Using docker-hub:

`docker search centos` - looking for image by name

`docker pull centos` - download repository of selected image

`docker push yourname/newimage` - Pushing a repository to Docker Hub( You have to be registered)

####Using docker:

### Build image

`docker images` 		show docker images

`docker build -t docker/nginx .` - build image with tag docker/nginx

### Run container

`docker ps -l` 	get containers, you can get the name of container created before

`docker run hello-world`	to verify that Docker is running only

`docker run -d -p 80:80` --name webserver2 nginx 	- pull and run docker image (nginx) in background( -d )

`docker run -d -p 80:80 docker/nginx` - run own image (docker/nginx) in background. If you don’t specify —name container name is random

`docker start webserver`	- starting container webserver

`docker stop webserver`	- stopping container webserver

### Check IP and docker network settings

`docker inspect web` - get information about container(get IP number etc.)

### How to connect with container

`sudo docker attach eeb48ce48e4f` - Attach to a running container

`sudo docker exec -i -t eeb48ce48e4f /bin/bash` - run bash command line from container(you are inside container)

### Remove containers and images

docker kill mariadbtest - kill docker process
docker rm -v mariadbtest - remove container

docker rmi images_webnginx - remove image

###How to build docker for project:

If you want create a few containers for docker you don’t have to run bash commands like docker run -d -p 80:80 --name webserver2 nginx

you can just use docker-compose(https://docs.docker.com/compose/install/)

Docker compose use yml file similar to composer. You just need to create file docker-compose.yml

```
version: '2'
services:
  web:
    build: docker/nginx
    volumes: 
      - .:/app
    ports: 
      - "8080:80"
    links:
      - php
  php:
    build: docker/php-fpm
    volumes:
      - .:/app
    working_dir: /app
    links:
      - db
  db:
    image: mariadb:latest
    ports:
      - "3306:3306"
    volumes:
      - /private/var/lib/mysql:/var/lib/mysql
    environment:
      MYSQL_ROOT_PASSWORD: myrootpass
      MYSQL_DATABASE: db
      MYSQL_USER: user
      MYSQL_PASSWORD: pass
```
Whole files structure for the project can looks like:
```
app
..
docker/
   	 nginx/
       	 	Dockerfile
	 php-fpm/
		Dockerfile
web
docker-compose.yml

```

To run all containers you just have to put

```docker-compose up```

To run containers in background use option -d

```docker-compose up -d```

To build/rebuild containers

```docker-compose build```
