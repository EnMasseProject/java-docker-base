FROM registry.fedoraproject.org/fedora-minimal:31 

RUN microdnf install java-11-openjdk-devel openssl apr && microdnf clean all
ENV JAVA_HOME /usr/lib/jvm/java
ADD scripts/ /opt/run-java/
