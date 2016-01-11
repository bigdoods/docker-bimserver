## docker-bimserver

A docker image to deploy:

BIMserver 1.4.0 (FINAL-2015-11-04)

on a remote server with Ubuntu14.04x64. The Dockerfile will install dependencies such as JDK and Tomcat 8.0.30 and then install BIMserver 1.4.0 into the webapps dir inside Tomcats home. Simply SSH into a server, install Docker with

```bash
$ wget -qO- https://get.docker.com/ | sh
```

and run the following (change username and password to your own choice):

```bash
$ docker run -d \
	-e TOMCAT_USER=xxx \
	-e TOMCAT_PASSWORD=xxx \
	-p 8080:8080 \
	--restart=always \
	connoralexander/docker-bimserver
```

This will pull the 'latest' tagged image. For other tags please see Tags on Dockerhub. To use a specific tag, put `:TAGNAME` after the docker image at the end of the run command.