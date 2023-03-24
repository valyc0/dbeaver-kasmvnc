FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntujammy

# set version label
ARG BUILD_DATE
ARG VERSION
ARG DBEAVER_VERSION="23.0.0"
ARG DBEAVER_LINK="https://dbeaver.io/files/${DBEAVER_VERSION}/dbeaver-ce-${DBEAVER_VERSION}-linux.gtk.x86_64.tar.gz"
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"



RUN \
echo "**** install build packages ****" && \
  apt-get update && \
  apt-get install -y \
    libswt-gtk-4-java && \
  echo "**** install dbeaver ****" && \
  curl -sL ${DBEAVER_LINK} | tar -xz -C /tmp 


# add local files
COPY /root /

# ports and volumes
EXPOSE 3000

VOLUME /config
