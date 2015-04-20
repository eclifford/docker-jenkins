FROM jenkins
MAINTAINER Eric Clifford <ericgclifford@gmail.com>

# switch to root
USER root

# install jenkins plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
USER jenkins
