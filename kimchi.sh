#!/bin/bash

# FROM: http://www.ubuntuboss.com/ubuntu-server-18-04-as-a-hypervisor-using-kvm-and-kimchi-for-vm-management/
# FROM: https://blog.thenets.org/create-a-linux-server-for-vm-and-manage-through-web-with-kvm-kimchi-wok/

set -e &&\

sudo apt update &&\
sudo apt upgrade -y &&\

sudo apt install -y nginx \
    qemu \
    qemu-kvm \
    libvirt-bin \
    python-paramiko \
    python-pil \
    novnc \
    python-libvirt \
    python-ethtool \
    python-ipaddr \
    python-guestfs \
    libguestfs-tools \
    spice-html5 \
    spice-html5 \
    python-magic \
    keyutils \
    libnfsidmap2 \
    libtirpc1 \
    nfs-common \
    rpcbind \
    python-configobj \
    python-parted \
    python-cherrypy3 \
    python-cheetah \
    python-jsonschema \
    python-m2crypto \
    python-pam \
    python-lxml \
    python-ldap \
    python-psutil \
    fonts-font-awesome \
    python-functools32 \
    python-mock \
    python-pyasn1-modules \
    python-typing \
    libjs-sphinxdoc \
    libjs-jquery \
    libjs-underscore \

&&\

wget https://github.com/kimchi-project/kimchi/releases/download/2.5.0/wok-2.5.0-0.noarch.deb &&\
wget https://github.com/kimchi-project/kimchi/releases/download/2.5.0/kimchi-2.5.0-0.noarch.deb &&\

sudo dpkg -i wok-2.5.0-0.noarch.deb &&\
sudo apt install -f -y &&\

sudo dpkg --ignore-depends=python-imaging -i kimchi-2.5.0-0.noarch.deb &&\

echo "Kimchi should now be available at: https://<server_pi>:8001/"
