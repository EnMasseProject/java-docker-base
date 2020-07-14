FROM registry.fedoraproject.org/fedora:31 AS jni

ARG NETTY_TCNATIVE_VERSION=2.0.31.Final

RUN dnf -y update
RUN dnf -y install java-11-openjdk-devel openssl-devel apr-devel maven git autoconf automake libtool which apr-devel make

RUN git clone https://github.com/netty/netty-tcnative
WORKDIR /netty-tcnative
RUN git checkout netty-tcnative-parent-$NETTY_TCNATIVE_VERSION
WORKDIR /

RUN mvn -B clean install -f netty-tcnative/openssl-dynamic/pom.xml -am -DskipTests
RUN install -m 0755 netty-tcnative/openssl-dynamic/target/native-lib-only/META-INF/native/linux64/libnetty_tcnative.so /usr/lib64/libnetty_tcnative.so

FROM registry.fedoraproject.org/fedora-minimal:31

COPY --from=jni /usr/lib64/libnetty_tcnative.so /usr/lib64/libnetty_tcnative.so

RUN microdnf install java-11-openjdk-headless openssl apr && microdnf clean all
ENV JAVA_HOME /usr/lib/jvm/java
ADD scripts/ /opt/run-java/
