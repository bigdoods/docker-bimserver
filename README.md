## docker-bimserver

A docker image to deploy BIMserver 1.4.0

```bash
$ docker run -d \
	-e TOMCAT_USER=xxx \
	-e TOMCAT_PASSWORD=xxx \
	-v /bimdata:/opt/tomcat/webapps/BIMserver/WEB-INF/*uploads folder* \
	-p 8080:8080 \
	bimscript/bimserver:0.0.1
```
