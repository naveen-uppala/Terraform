Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//

#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

######################  Update Linux packages and Install Java ######################
#!/bin/bash 
yum update -y
yum upgrade -y
yum install java-17-amazon-corretto-headless -y

######################  Install Docker and start docker service ######################

yum install docker -y
service docker start
systemctl enable docker
usermod -aG docker ec2-user
setfacl -m user:ec2-user:rw /var/run/docker.sock

########################## Download and Install Apache Maven on Amazon Linux 2 ###################

set -e
mvn_version=${mvn_version:-3.9.4}
url="https://dlcdn.apache.org/maven/maven-3/${mvn_version}/binaries/apache-maven-${mvn_version}-bin.tar.gz"
mkdir -p /opt/maven
install_dir="/opt/maven"
curl -fsSL ${url} | tar zx --strip-components=1 -C ${install_dir}
cat << EOF > /etc/profile.d/maven.sh
#!/bin/sh
export MAVEN_HOME=${install_dir}
export M2_HOME=${install_dir}
export M2=${install_dir}/bin
export PATH=${install_dir}/bin:$PATH
EOF
source /etc/profile.d/maven.sh
echo maven installed to ${install_dir}
printf "\n\nTo get mvn in your path, open a new shell or execute: source /etc/profile.d/maven.sh\n"

################### Install  AWS CLI tool on EC2 #############################
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip 
./aws/install 

################### Install kubectl CLI tool on EC2 #############################
 
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.7/2022-06-29/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

################### Install  Kustomize CLI tool on EC2 #############################
curl --silent --location --remote-name \
  "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v3.2.3/kustomize_kustomize.v3.2.3_linux_amd64" && \
  chmod a+x kustomize_kustomize.v3.2.3_linux_amd64 && \
  mv kustomize_kustomize.v3.2.3_linux_amd64 /usr/local/bin/kustomize
--//--
