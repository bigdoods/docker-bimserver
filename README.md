## docker-bimserver

A docker image to run bimserver

```bash
$ docker run -d \
	-e TOMCAT_USER=xxx \
	-e TOMCAT_PASSWORD=xxx \
	-p 8080:8080 \
	bimscript/bimserver:0.0.1
```
