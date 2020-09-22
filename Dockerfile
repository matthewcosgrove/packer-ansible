FROM mattcosgrove/govc-packer
MAINTAINER "Matthew Cosgrove <mc.matthew.cosgrove@gmail.com>"

RUN apt-add-repository ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible
