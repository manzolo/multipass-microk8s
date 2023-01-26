#!/bin/bash

sudo swapoff -a
sudo snap install microk8s --classic --stable
# add user to microk8s sudoers group
sudo usermod -a -G microk8s ubuntu

group=microk8s

if [ $(id -gn) != $group ]; then
  exec sg $group "$0 $*"
fi

sudo snap alias microk8s.helm helm
sudo snap alias microk8s.helm3 helm3

# add kubect as alias
sudo snap alias microk8s.kubectl kubectl
sudo snap alias microk8s.kubectl k

microk8s enable dns
microk8s enable hostpath-storage
microk8s enable dashboard
microk8s enable helm
microk8s enable ingress
