Content-Type: multipart/mixed; boundary="//"
MIME-Version: 1.0

--//
Content-Type: text/cloud-config; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="cloud-config.txt"

#cloud-config
cloud_final_modules:
- [scripts-user, always]

--//
Content-Type: text/x-shellscript; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="userdata.txt"


#!/bin/bash 
sudo yum update -y
sudo yum upgrade -y
sudo yum install docker -y
sudo service docker start
sudo usermod -aG docker ec2-user
sudo setfacl -m user:ec2-user:rw /var/run/docker.sock
sudo docker pull nginx
sudo docker run -d -p 80:80 ng
