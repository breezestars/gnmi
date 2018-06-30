## Image name: faucet/gnmi

FROM ubuntu:16.04

ENV GOPATH=$HOME/go
ENV GOBIN=$GOPATH/bin
ENV PATH=$GOBIN:${PATH}
ENV SRCDIR=$GOPATH/src/github.com/breezestars
ENV GNXI_BRANCH=non-auth
ENV HOME=/home/faucet
ENV GNMI_TARGET=localhost
ENV GNMI_PORT=10161

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends \
      apt-utils \
      ca-certificates \
      software-properties-common && \
    add-apt-repository -y ppa:longsleep/golang-backports && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy --no-install-recommends \
      apt-utils \
      ca-certificates \
      software-properties-common \
      tmux \
      fping \
      git \
      golang-go \
      iproute2 \
      iputils-ping \
      net-tools \
      netcat-openbsd \
      openssh-client \
      psmisc \
      sudo \
      vim \
      git && \
    mkdir $HOME && \
    mkdir -p $SRCDIR && \
    cd $SRCDIR && \
    git clone -b $GNXI_BRANCH https://github.com/breezestars/gnxi.git && \
    go install -v \
          github.com/breezestars/gnxi/gnmi_capabilities \
          github.com/breezestars/gnxi/gnmi_get \
          github.com/breezestars/gnxi/gnmi_set \
          github.com/breezestars/gnxi/gnmi_target

WORKDIR $HOME
COPY ./ .

EXPOSE 10161
CMD ./_startup.sh && \
    /bin/bash
