#!/bin/bash
cd /tmp && wget http://mirror.olnevhost.net/pub/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
cd  /tmp && tar xvf apache-maven-3.0.5-bin.tar.gz
cd /tmp && mv apache-maven-3.0.5  /usr/local/apache-maven
cat <<EOF >~/.bashrc
export M2_HOME=/usr/local/apache-maven
export M2=$M2_HOME/bin 
export PATH=$M2:$PATH
EOF
source ~/.bashrc
