#!/bin/bash

yum -y update
yum -y install epel-release
yum -y install wget curl openssh-server vim git gcc libffi-devel openssl-devel python-devel python-pip
pip install --upgrade pip
pip install --upgrade ansible
