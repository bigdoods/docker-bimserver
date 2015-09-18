FROM ubuntu:14.04
MAINTAINER BIMscript Ltd

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install \
	default-jdk \
	git \
	ant \
	wget
RUN echo "Europe/London" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata
RUN mkdir /opt/tomcat
RUN groupadd tomcat
RUN useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat
RUN wget http://mirrors.ukfast.co.uk/sites/ftp.apache.org/tomcat/tomcat-8/v8.0.26/bin/apache-tomcat-8.0.26.tar.gz \
	-O /tmp/apache-tomcat-8.0.26.tar.gz
RUN tar xvf /tmp/apache-tomcat-8.0.26.tar.gz -C /opt/tomcat --strip-components=1
RUN rm -f /tmp/apache-tomcat-8.0.26.tar.gz
#cd /opt/tomcat
RUN chgrp -R tomcat /opt/tomcat/conf
RUN chmod g+rwx /opt/tomcat/conf
RUN chmod g+r /opt/tomcat/conf/*
RUN chown -R tomcat /opt/tomcat/work/ /opt/tomcat/temp/ /opt/tomcat/logs/
RUN chown -R tomcat /opt && chown -R tomcat /opt/tomcat/webapps
RUN chmod 777 /opt && chmod 777 /opt/tomcat/webapps
RUN wget https://github.com/opensourceBIM/BIMserver/releases/download/1.4.0-FINAL-2015-09-14/bimserver-1.4.0-FINAL-2015-09-14.war \
	-O /opt/tomcat/webapps/BIMserver.war
ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/jre
ENV CATALINA_HOME=/opt/tomcat
ENV JAVA_OPTS="-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"
ENV CATALINA_OPTS="-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
ADD ./web.xml /opt/tomcat/webapps/manager/WEB-INF/web.xml
ADD ./run.sh /opt/run.sh
USER tomcat
EXPOSE 8080
ENTRYPOINT ["bash", "/opt/run.sh"]
