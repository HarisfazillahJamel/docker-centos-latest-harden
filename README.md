# Docker Centos 8  With OpenSSH

This is my testing docker. Used at your own risk.

Docker Container With Centos 8 harden and secure. Include SSH OpenSSH to access the server. The default user is root and the password is here :-

https://hub.docker.com/repository/docker/linuxmalaysia/docker-centos-latest-harden/general

This docker is installed with :-

- OpenSSH
- LinuxMalaysia ASIMP in /home/user1
  https://github.com/linuxmalaysia/ASIMP.git

Latest information in the docker/Dockerfile and hardening[.]sh

Dockerfile still with this warning.

[WARNING]: Empty continuation lines will become errors in a future release.

### To installed in your Linux

```sh
docker pull linuxmalaysia/docker-centos-latest-harden
```
```sh
docker run --privileged=true -it -d -P --name my_centos8 linuxmalaysia/docker-centos-latest-harden
```
You can then use docker port to find out what host port, the container's port 22 is mapped to :-

```sh
docker port my_centos8
```

```sh
docker port my_centos8 port 22/tcp
```

```sh
ssh user1@localhost -p ?????
```

### To build yourself
```sh
git clone https://github.com/HarisfazillahJamel/docker-centos-latest-harden.git
```
```sh
cd docker-centos-latest-harden
```
```sh
docker build -t docker-centos-latest-harden .
```
```sh
docker run --privileged=true -it -d -P --name my_centos8 docker-centos-latest-harden
```

haris @ Harisfazillah Jamel @ LinuxMalaysia

28 Jan 2020
