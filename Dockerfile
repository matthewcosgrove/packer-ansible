FROM mattcosgrove/govc-packer
MAINTAINER "Matthew Cosgrove <mc.matthew.cosgrove@gmail.com>"

RUN apt-get install -y python3 python3-pip && \
    apt-get update && \
    pip3 install ansible
