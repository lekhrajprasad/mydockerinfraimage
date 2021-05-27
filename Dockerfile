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
