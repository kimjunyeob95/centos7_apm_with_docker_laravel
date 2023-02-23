# Prerequisite

## window docker 설치 및 환경 구축
1. 도커 설치
2. WSL2 환경 구축

    https://velog.io/@hanjuli94/%EC%9C%88%EB%8F%84%EC%9A%B0%EC%97%90%EC%84%9C-%EB%8F%84%EC%BB%A4-%EC%8B%A4%EC%8A%B5%ED%95%98%EA%B8%B0

## 파일 최신화
SOURCE안의 디렉토리 별로 최신화 소스를 넣어주세요

# How to use
## 1. docker-compose up -d

## 2. docker 터미널로 접속

## 3. ssh 설정
```bash
# ssh 설치 && 환경설정
$ vi /etc/ssh/sshd_config
# Port 22번 주석 해제
# PermitRootLogin 부분을 yes로 변경
# passwd root 명령어로 비밀번호 설정
$ passwd root
```
## 4. mysql 설정
```bash
# 1. 초기 비밀번호 확인
$ grep 'temporary password' /var/log/mysqld.log
# 2. mysql 접속 후  임시로 보안수준 높은 비밀번호로 변경
mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('qntmxkDB12!@');
# 3. 변경 후 systemctl restart mysqld 재시작하면 설정해둔 my.cnf로 인해 보안수준 낮은 비밀번호로 변경
systemctl restart mysqld
# 4. 보안 낮은 비밀번호로 변경 가능
mysql> SET PASSWORD FOR 'root'@'localhost' = PASSWORD('1234');
# 5. 외부 접근 허용 후 적용
mysql> grant all privileges on *.* to 'root'@'%' identified by '1234';
mysql> flush privileges;
```
## 5. application 시작
```bash
$ systemctl restart sshd
$ systemctl start httpd
$ systemctl start mysqld
```

## 6. laravel 실행
```bash
$ composer install
$ npm install --no-optional --no-shrinkwrap --no-package-lock
$ npm run dev # 이 후 Front 소르를 개발 시 npm run watch로 실행
$ php artisan serve --host 0.0.0.0 --port 80
```

## 7. HTTPS 설정
1. localhost에서 SSL를 적용해야합니다. 도커로 CentOS 환경이 구성되면 직접 터미널에서 적용하시면 됩니다.
    https://seul96.tistory.com/348

# ETC

## enviroment
Centos7 Apache2.4 php7.2 Mysql5.7 node8.10

## port
1. 80 웹서버
2. 443 SSL
3. 3307 DB
4. 5222 SSH

## description
local에 파일을 두고 docker와 volumes을 맞추고 싶었지만 vendor, node_modules 파일들 때문에 페이지 렌더링 속도가 매우 느려 ssh로 접속해서 작업하는 방향으로 선택했습니다.


