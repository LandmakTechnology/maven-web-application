FROM tomcat:9.0.91-jdk11-corretto
# author is Simon Legah of Landmark Technologies
# TESTING
# good, better, best
COPY target/*.war /usr/local/tomcat/webapps/webapp.war
