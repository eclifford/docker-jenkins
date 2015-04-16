FROM jenkins
MAINTAINER Eric Clifford <ericgclifford@gmail.com>

# switch to root
USER root
RUN mkdir -p /var/www/html ; chown -R jenkins:jenkins /var/www/html
RUN apt-get update

# install everything we need to build
RUN apt-get install -y git nodejs npm

# install jenkins plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
USER jenkins

VOLUME ["$JENKINS_HOME", "/var/www/html"]
