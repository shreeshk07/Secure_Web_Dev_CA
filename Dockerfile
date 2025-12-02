FROM tomcat:9.0

# copy our full cleaned project directly into Tomcat webapps
COPY root/ /usr/local/tomcat/webapps/bodgeit/

EXPOSE 8080