# Prerequisite

## window

1. WSL2 환경 구축

# How to use

1. docker-compose up -d

# ETC

## enviroment
Centos7 Apache2.4 php7.2 Mysql5.7 node8.10

## description
1. centos7/Dockerfile에서 application을 다운받는다.
2. 라라벨을 실행하기위해 80포트를 열어두고 astisan으로 해당 포트를 할당해 웹서버를 띄운다.

## finnaly
1. linux환경에서 application들을 설치하지말고 docker image기능으로 각 각의 영역을 세분화 시키는게 나을 거 같다.
2. 라라벨은 도커환경에서 웹서버 랜더링 속도가 좀 느리다 (이유는 vendor 폴더라고 예상됨)


