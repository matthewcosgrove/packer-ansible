FROM golang:alpine
MAINTAINER "Matthew Cosgrove <mc.matthew.cosgrove@gmail.com>"

ENV PACKER_DEV=1

RUN apk add --update git bash openssl ansible wget

ENV PACKER_VERSION=1.6.4
ENV PACKER_SHA256SUM=a20ec68e9eb6e1d6016481003f705babbecc28e234f8434f3a35f675cb200ea8

ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_SHA256SUMS ./

RUN sed -i '/.*linux_amd64.zip/!d' packer_${PACKER_VERSION}_SHA256SUMS
RUN sha256sum -cs packer_${PACKER_VERSION}_SHA256SUMS
RUN unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /bin
RUN rm -f packer_${PACKER_VERSION}_linux_amd64.zip
ENTRYPOINT ["/bin/bash", "-c"]
