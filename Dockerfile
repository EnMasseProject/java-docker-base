FROM centos:7

RUN yum -y update && yum -y install java-11-openjdk-devel && yum -y clean all
ENV JAVA_HOME /usr/lib/jvm/java
ADD scripts/* /opt/run-java/
