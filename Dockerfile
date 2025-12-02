FROM tomcat:9.0


COPY root/ /usr/local/tomcat/webapps/bodgeit/

EXPOSE 8080