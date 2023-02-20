#!/bin/bash

userName="stage";
mkdir -p /home/daemon/mysql/data
mkdir -p /home/centos/dev/${userName}/web /home/centos/dev/${userName}/crawling /home/centos/dev/${userName}/process /home/centos/dev/${userName}/settlement
chmod -R 777 /home/daemon/
chmod -R 777 /home/centos/

echo -e "\n" >> ~/.bashrc
echo "alias stage='cd /home/centos/dev/stage/'" >> ~/.bashrc
echo -e "\n" >> ~/.bashrc
echo "alias stage_w='cd /home/centos/dev/stage/web'" >> ~/.bashrc
echo -e "\n" >> ~/.bashrc
echo "alias stage_p='cd /home/centos/dev/stage/process'" >> ~/.bashrc
source ~/.bashrc

# systemctl start httpd
# systemctl start mysqld
