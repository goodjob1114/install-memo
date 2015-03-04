#!/bin/bash

init() {
  yum -y update
  yum -y groupinstall "Development Tools"
  yum -y install openssl-devel
}

init

yum -y install nodejs

yum -y install npm

npm install -g n

n stable
