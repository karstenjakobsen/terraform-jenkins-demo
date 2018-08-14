FROM jenkins/jenkins:lts-alpine
MAINTAINER Karsten Kaj Jakobsen <kj@patientsky.com>

USER root

RUN apk -U add docker

# Setup Jenkins
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

RUN apk add --update shadow \
    && groupadd -g 50 staff \
    && usermod -a -G staff jenkins

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=true"

USER root

