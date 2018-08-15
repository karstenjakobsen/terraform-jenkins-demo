FROM jenkins/jenkins:lts-alpine
MAINTAINER Karsten Kaj Jakobsen <kj@patientsky.com>

USER root

RUN apk -U add docker curl

# Setup Jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN apk add --update shadow \
    && groupadd -g 50 staff \
    && usermod -a -G staff jenkins

COPY packages/plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

EXPOSE 8080
EXPOSE 50000

USER root

