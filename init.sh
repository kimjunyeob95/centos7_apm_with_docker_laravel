#!/bin/bash

userName="stage";
mkdir -p /home/centos/dev/${userName}/web /home/centos/dev/${userName}/settlement-crawling /home/centos/dev/${userName}/process /home/centos/dev/${userName}/etl

echo -e "\n" >> ~/.bashrc
echo "alias stage='cd /home/centos/dev/stage/'" >> ~/.bashrc
echo -e "\n" >> ~/.bashrc
echo "alias stage_w='cd /home/centos/dev/stage/web'" >> ~/.bashrc
echo -e "\n" >> ~/.bashrc
echo "alias stage_p='cd /home/centos/dev/stage/process'" >> ~/.bashrc
echo -e "\n" >> ~/.bashrc
echo "alias stage_e='cd /home/centos/dev/stage/etl'" >> ~/.bashrc
echo -e "\n" >> ~/.bashrc
echo "alias stage_c='cd /home/centos/dev/stage/settlement-crawling'" >> ~/.bashrc
echo -e "\n" >> ~/.bashrc
echo "alias sshd='/usr/sbin/sshd'" >> ~/.bashrc
echo -e "\n" >> ~/.bashrc
echo "alias python3='/usr/local/bin/python3.9'" >> ~/.bashrc
source ~/.bashrc