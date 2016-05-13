#!/bin/bash -x

#Update system and install necessary packages for ansible
yum -y update
yum -y install epel-release
yum -y install wget curl openssh-server vim git gcc libffi-devel openssl-devel python-devel python-pip sshpass
pip install --upgrade pip
pip install --upgrade ansible

#Patch to fix Vagrant 1.8.1 not being able to find Ansible > 2.0
## See https://github.com/mitchellh/vagrant/issues/6793
echo "Patching ansible-galaxy"
galaxy="/usr/bin/ansible-galaxy"
patch='if sys.argv == ["/usr/bin/ansible-galaxy", "--help"]: sys.argv.insert(1, "info")'
[[ ! -f ${galaxy} ]] || grep -F -q "${patch}" ${galaxy} || sudo sed -i "/__main__/a \\    ${patch}" ${galaxy}
