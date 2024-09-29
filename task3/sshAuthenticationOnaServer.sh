#!/bin/bash

password=$1

# for virtual machine

if [ ! -f ~/.ssh/id_rsa ]; then
	ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
fi

sshpass -p "$password" ssh-copy id -o StrictHostKeyChecking=no  -i ~/.ssh/id_rsa.pub $askarov@192.168.0.103
sshpass -p "$password" ssh -o StrictHostKeyChecking=no askarov@192.168.0.103 "chmod 700 ~/.ssh; chmod 600 ~/.ssh/authorized_keys"
ssh -v askarov@192.168.0.103

