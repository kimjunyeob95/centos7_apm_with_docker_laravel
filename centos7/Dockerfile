FROM centos:7.5.1804

# -y 옵션은 설치여부 질문에 yes로 대답하라는 의미

# sudo 권한 설치
RUN yum update -y
RUN yum install -y sudo
RUN yum install -y epel-release
RUN yum provides netstat
RUN yum install -y net-tools

#nodjs8.x && git 설치
RUN yum install -y gcc-c++ make
RUN curl -sL https://rpm.nodesource.com/setup_8.x | sudo -E bash -
RUN yum install -y nodejs
RUN yum install -y git

#apache 설치
RUN sudo yum install -y httpd
RUN sudo yum install -y mod_ssl

# PHP 설치
RUN sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN sudo yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm
# PHP 7.2버전 설정
RUN sudo yum-config-manager --enable remi-php72
RUN sudo yum install -y php php-common php-fpm php-mysql php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml php-pecl-apc php-cli php-pear php-pdo
RUN sudo yum install -y php-zip wget unzip

# MYSQL5.7 설치
RUN rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
RUN wget http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm
RUN sudo yum -y localinstall mysql57-community-release-el7-7.noarch.rpm
RUN sudo yum repolist enabled | grep "mysql.*-community.*"
RUN sudo yum install -y mysql-community-server mysql mysql-libs mysql-devel mysql-server

# mysql 비밀번호 설정
# 1. 초기 비밀번호 확인 후 임시로 보안수준 높은 비밀번호로 변경
# 2. 변경 후 systemctl restart mysqld 재시작하면 설정해둔 my.cnf로 인해 보안수준 낮은 비밀번호로 변경
# 3. 외부접근 허용 설정
# grep 'temporary password' /var/log/mysqld.log 명령어로 초기 비밀번호 확인가능
# mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('1234'); // 비밀번호 설정
# mysql> grant all privileges on *.* to 'root'@'%' identified by '1234'; // 외부 접근 허용
# mysql> flush privileges;

COPY cert.pem /etc/httpd/conf/server.crt
COPY key.pem /etc/httpd/conf/server.key

ADD /init.sh /
RUN chmod +x /init.sh
# 작업 경로 생성
RUN ["/bin/bash","-c","sh /init.sh"]

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

RUN systemctl start httpd
RUN systemctl start mysqld
RUN php artisan serve --host 0.0.0.0 --port 80

EXPOSE 80
EXPOSE 443
EXPOSE 3306
EXPOSE 8090
