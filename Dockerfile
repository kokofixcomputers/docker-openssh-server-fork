FROM lsiobase/alpine:3.10

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="aptalca"

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache --upgrade \
        openssh-server && \
 echo "**** setup openssh environment ****" && \
 sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config && \
 ssh-keygen -A && \
 rm -rf \
        /tmp/*

# add local files
COPY /root /