#!/bin/bash 
cd /tmp
wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
sudo tar xf /tmp/apache-maven-*.tar.gz -C /opt
sudo ln -s /opt/apache-maven-3.9.4 /opt/maven
sudo touch -p /etc/profile.d/maven.sh
sudo echo -e " export JAVA_HOME=/usr/lib/jvm/jre-17
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven\
export PATH=${M2_HOME}/bin:${PATH}"  >> /etc/profile.d/maven.sh
sudo chmod +x /etc/profile.d/maven.sh
source /etc/profile.d/maven.sh
mvn -version
