FROM centos:8
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
ENV JAVA="${JAVA_HOME}/bin"

RUN yum install java-1.8.0-openjdk-devel wget -y

ENV maven_version=3.8.1
ENV M2_HOME=/usr/local/apache-maven-${maven_version}
ENV M2="${M2_HOME}/bin"
ENV PATH=$PATH:$JAVA:$M2

RUN wget https://downloads.apache.org/maven/maven-3/${maven_version}/binaries/apache-maven-${maven_version}-bin.tar.gz -P /tmp \
    && tar xvfz /tmp/apache-maven-${maven_version}-bin.tar.gz -C /usr/local \
    && rm -rf /tmp/apache-maven-${maven_version}-bin.tar.gz \
    && yum clean all

EXPOSE 5000
ENV tomcat_version=9.0.46
RUN wget https://mirrors.estointernet.in/apache/tomcat/tomcat-9/v${tomcat_version}/bin/apache-tomcat-${tomcat_version}.tar.gz -P /tmp \
    && tar xvfz /tmp/apache-tomcat-${tomcat_version}.tar.gz -C /opt/ \
    && rm -rf /tmp/apache-tomcat-9*.tar.gz \
    && yum clean all
ADD server.xml /opt/apache-tomcat-${tomcat_version}/conf/
ADD tomcat-users.xml /opt/apache-tomcat-${tomcat_version}/conf/
