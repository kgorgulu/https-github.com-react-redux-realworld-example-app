FROM --platform=linux/amd64 jenkins/jenkins:alpine-jdk17
USER root

RUN apk -v --no-cache --update add \
    nodejs-current npm
RUN apk add py3-pip
RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo make
RUN pip install --upgrade pipRUN pip install azure-cli



RUN apk add --update docker openrc
RUN rc-update add docker boot


# docker run -p 8080:8080 -p 50000:50000 --restart=on-failure -v /var/run/docker.sock:/var/run/docker.sock -d  -v $(pwd)/datadir:/var/jenkins_home --env JAVA_OPTS=-Xmx4g --name jenkins-nodejs-dind jenkins-nodejs-dind

# docker build -t test-j . --platform=linux/amd64
