FROM centos:latest
MAINTAINER Ganesh Radhakrishnan ganrad01@gmail.com

RUN yum install -y wget which git

# Builder version
#ENV JAVA_HOME /usr/lib/jvm/default-java
ENV BUILDER_VERSION 1.0
ENV MAVEN_VERSION 3.5.3
ENV MAVEN_HOME /usr/lib/mvn
ENV PATH $MAVEN_HOME/bin:$PATH

LABEL io.k8s.description="Base image for running a Java Spring Boot application" \
      io.k8s.display-name="Purchase Order (RESTFul) Service Spring Boot Application 1.0" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="Java,Springboot"

# Install required util packages
RUN yum -y update; \
    yum install ca-certificates -y; \
    yum install sudo -y; \
    yum clean all -y

# Install OpenJDK 1.8, create required directories.
#RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
#    yum clean all -y && \
#    mkdir -p /home/apps
#    # checking java version
#    RUN java -version
#    # checking which java
#    RUN which java
#RUN echo $JAVA_HOME/bin/javac -version
## Added for maven
#RUN echo $pwd
COPY  jdk-8u60-linux-x64.tar.gz /usr/share
ADD JAVA_Install.sh /usr/share
RUN chmod +x  /usr/share/JAVA_Install.sh
RUN echo $JAVA_HOME
RUN bash /usr/share/JAVA_Install.sh  /usr/share/jdk-8u60-linux-x64.tar.gz && source "/root/.bashrc"


RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
&& tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz \
&& mv apache-maven-$MAVEN_VERSION /usr/lib/mvn

RUN mvn --version


# Change working directory
WORKDIR /root
RUN git clone https://github.com/aliasgharmhowwala/spring-bootappaks.git
RUN cd /root/spring-bootappaks/ && mvn clean install
#RUN mvn clean install

# For Spring Boot, there should only be 1 fat jar
#ADD ./target/po-rest-service-1.0.jar /home/apps/po-rest-service-1.0.jar

# Run the po-rest-service application
#CMD java -jar ./po-rest-service-1.0.jar
