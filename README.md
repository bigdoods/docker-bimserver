## docker-bimserver

A docker image to deploy BIMserver 1.4.0 on a remote server with Ubuntu14.04x64. The Dockerfile will install dependencies such as JDK and Tomcat 8.0.26 and then install BIMserver 1.4.0 into the webapps dir inside Tomcats home. Simply SSH into a server and run the following:

```bash
$ docker run -d \
	-e TOMCAT_USER=xxx \
	-e TOMCAT_PASSWORD=xxx \
	-p 8080:8080 \
	--restart=always \
	bimscript/docker-bimserver
```