FROM node:14.5
MAINTAINER Gideon van der Merwe "gideon@webbest.co.za"
ENV REFRESHED_AT 2021-06-15

ADD . /app
WORKDIR /app
# Install OpenJDK-11
RUN echo 'deb http://ftp.debian.org/debian stretch-backports main' | tee /etc/apt/sources.list.d/stretch-backports.list

RUN apt-get update && \
    apt-get install -y openjdk-11-jre-headless && \
    apt-get clean;
RUN npm i -g firebase-tools
RUN firebase --version
EXPOSE  4400 4500 5000 5001 8001 8080 8085 9000
