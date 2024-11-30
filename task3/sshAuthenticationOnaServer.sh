#!/bin/bash

password=$1
username=$2
host_ip=$3
# for virtual machine

if [ ! -f ~/.ssh/id_rsa ]; then
	ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
fi

sshpass -p "$password" ssh-copy id -o StrictHostKeyChecking=no  -i ~/.ssh/id_rsa.pub $username@$host_ip
sshpass -p "$password" ssh -o StrictHostKeyChecking=no $username@$host_ip "chmod 700 ~/.ssh; chmod 600 ~/.ssh/authorized_keys"
ssh -v $username@$host_ip

