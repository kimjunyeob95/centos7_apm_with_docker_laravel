#!/bin/bash

userName="stage";
mkdir -p /home/daemon/mysql/data
mkdir -p /home/centos/dev/${userName}/web /home/centos/dev/${userName}/crawling /home/centos/dev/${userName}/process /home/centos/dev/${userName}/settlement
chmod -R 777 /home/daemon/
chmod -R 777 /home/centos/
chmod -R 777 /home/centos/dev/${userName}

echo -e "\n" >> ~/.bashrc
echo "alias stage='cd /home/centos/dev/stage/'" >> ~/.bashrc
echo -e "\n" >> ~/.bashrc
echo "alias stage_w='cd /home/centos/dev/stage/web'" >> ~/.bashrc
echo -e "\n" >> ~/.bashrc
echo "alias stage_p='cd /home/centos/dev/stage/process'" >> ~/.bashrc
echo -e "\n" >> ~/.bashrc
echo "alias sshd='/usr/sbin/sshd'" >> ~/.bashrc
source ~/.bashrc