## docker-bimserver

A docker image to deploy BIMserver 1.4.0

```bash
$ docker run -d \
	-e TOMCAT_USER=xxx \
	-e TOMCAT_PASSWORD=xxx \
	-v /bimdata:/opt/tomcat/webapps/BIMserver/WEB-INF/incoming \
	-p 8080:8080 \
	bimscript/docker-bimserver
```
