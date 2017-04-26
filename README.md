# Docker symfony on Mac (OS X)

### Introduction
This is my docker project created for symfony php framework(https://symfony.com/) projects.
I use docker on my Mac for large symfony application and met an performance issue described under https://forums.docker.com/t/file-access-in-mounted-volumes-extremely-slow-cpu-bound/8076/126.
To solve the issue I use in this project external library http://docker-sync.io/ with successful.
This solution synchronize files changes from my project path to docker images with delay below 1 s(can't see this).

Project is ready to work with Symfony 3.1.
Includes PHP7.1 + NGINX + MARIADB + xdebug + wkhtmltopdf + composer

I didn't tested it on Windows but it should work ;).

I use database localy so all database files are preserved on my local machine not in image.

### HOW TO START WITH THIS PROJECT

I will recomend to pull this repository localy and then copy docker files and paths(path docker, files docker-*) to your symfony project.
I have committed to this repo only one file to `web/` path, only to show that it's working fine.

### RUN project

#### OS X

##### Install http://docker-sync.io/

```gem install docker-sync```

##### Run as deamon
Running as deamon is very convenient and I will prefer this way. 

Described here: https://github.com/EugenMayer/docker-sync/wiki/2.3-daemon-mode#instead-of-docker-sync-stack-start

```
docker-sync-daemon start
docker-compose up
```

##### To stop sync

```docker-sync-daemon stop```


#### Linux

```docker-compose up```

To run containers in background use option -d

```docker-compose up -d```

To build/rebuild containers

```docker-compose build```

#### Useful commands 

I moved useful commands to separate section.

[a relative link](doc/USEFUL_COMMAND.md)
