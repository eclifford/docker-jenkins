FROM jenkins
MAINTAINER Eric Clifford <ericgclifford@gmail.com>

# switch to root
USER root
RUN apt-get update

# install everything we need to build
RUN apt-get install -y git nodejs npm

# switch back to jenkins user
USER jenkins

# install jenkins plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
