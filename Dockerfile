FROM images4dev/centos7

MAINTAINER xiao ma "jingpu.ma@leyantech.com"

ENV MYPATH /usr/local
WORKDIR $MYPATH

RUN yum install -y vim

ADD apache-tomcat-9.0.45.tar.gz /usr/local/

ADD jdk-8u291-linux-x64.tar.gz /usr/local/

ENV JAVA_HOME /usr/local/jdk1.8.0_291
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /usr/local/apache-tomcat-9.0.45
ENV CATALINA_BASH /usr/local/apache-tomcat-9.0.45
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin

EXPOSE 8080

CMD /usr/local/apache-tomcat-9.0.45/bin/startup.sh && tail -f /usr/local/apache-tomcat-9.0.45/logs/catalina.out
