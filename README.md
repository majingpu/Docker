# Docker
docker实践

## 实战：构建Dockerfile文件
Docker Hub中99%镜像都是从这个基础镜像过来的from scratch，然后配置需要的软件和配置来进行的构建

> 创建一个自己的tomcat镜像
1. 准备镜像文件tomcat、jdk
```shell
apache-tomcat-9.0.45.tar.gz
jdk-8u291-linux-x64.tar.gz
```

2.编写dockerfile
```shell
vim /data/dockerfile/Dockfile
```
3.构建镜像
```shell
docker build -f /data/dockerfile/Dockerfile -t tomcat01:v1.0 .
```
4.启动镜像
```shell
[root@VM-0-17-centos dockerfile]# docker run -d -p 9090:8080 -v /data/dockerfile/tomcat/webapps:/usr/local/apache-tomcat-9.0.45/webapps/test -v /data/dockerfile/tomcat/logs:/usr/local/apache-tomcat-9.0.45/logs --name test-tomcat tomcat01:v1.0
8dd7815dc8b1e692476d8656a45eff625d1b334149f8388d9adc66c3cc88e406
[root@VM-0-17-centos dockerfile]# docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED         STATUS         PORTS                                       NAMES
8dd7815dc8b1   tomcat01:v1.0   "/bin/sh -c '/usr/lo…"   8 seconds ago   Up 7 seconds   0.0.0.0:9090->8080/tcp, :::9090->8080/tcp   test-tomcat
```
5.访问测试
```shell
[root@VM-0-17-centos tomcat]# curl localhost:9090/test/index.html
hello world
```
