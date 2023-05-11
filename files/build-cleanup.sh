#!/bin/bash


apt-get remove -y autoconf automake libtool make cmake ninja-build pkg-config build-essential g++ gcc libicu-dev;
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/* ~/.composer || true
apt-get autoremove -y
sync

