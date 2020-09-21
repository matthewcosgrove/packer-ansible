FROM golang:alpine
MAINTAINER "Matthew Cosgrove <mc.matthew.cosgrove@gmail.com>"

ENV PACKER_DEV=1

RUN apk add --update git bash openssl ansible wget

ENV PACKER_VERSION=1.6.2
ENV PACKER_SHA256SUM=089fc9885263bb283f20e3e7917f85bb109d9335f24d59c81e6f3a0d4a96a608

ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_SHA256SUMS ./

RUN sed -i '/.*linux_amd64.zip/!d' packer_${PACKER_VERSION}_SHA256SUMS
RUN sha256sum -cs packer_${PACKER_VERSION}_SHA256SUMS
RUN unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /bin
RUN rm -f packer_${PACKER_VERSION}_linux_amd64.zip
ENTRYPOINT ["/bin/bash", "-c"]
