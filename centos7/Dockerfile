FROM centos:7.5.1804

# -y 옵션은 설치여부 질문에 yes로 대답하라는 의미

# sudo 권한 설치
RUN yum update -y
RUN yum install -y sudo
RUN yum install -y epel-release
RUN yum provides netstat
RUN yum install -y net-tools
RUN yum install -y wget

# 작업 경로 생성
ADD /init.sh /
RUN chmod +x /init.sh

RUN ["/bin/bash","-c","sh /init.sh"]

# ssh 설치 && 환경설정
RUN yum install -y net-tools vim openssh-server

# nodjs8.x && git 설치
RUN yum install -y gcc-c++ make
RUN curl -sL https://rpm.nodesource.com/setup_8.x | sudo -E bash -
RUN yum install -y nodejs
RUN yum install -y git
RUN yum install -y openssl

# apache 설치
RUN sudo yum install -y httpd
RUN sudo yum install -y mod_ssl

# PHP 설치
RUN sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN sudo yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
# PHP 7.2버전 설정
RUN sudo yum-config-manager --enable remi-php72
RUN sudo yum install -y php php-common php-fpm php-mysql php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml php-pecl-apc php-cli php-pear php-pdo
RUN sudo yum install -y php-zip wget unzip

# composer 설치
RUN curl -sS https://getcomposer.org/installer | php
RUN sudo mv composer.phar /usr/bin/composer

# # MYSQL5.7 설치
RUN rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
RUN yum install -y http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
RUN yum install -y mysql-community-server

COPY cert.pem /etc/httpd/conf/server.crt
COPY key.pem /etc/httpd/conf/server.key

COPY SOURCE/web /home/centos/dev/stage/web
COPY SOURCE/process /home/centos/dev/stage/process

# 최종 권한 부여
ADD /finnaly.sh /
RUN chmod +x /finnaly.sh

RUN ["/bin/bash","-c","sh /finnaly.sh"]

EXPOSE 80
EXPOSE 443
EXPOSE 3306
EXPOSE 3000
EXPOSE 22

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]