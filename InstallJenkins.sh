#! /bin/bash

# Install Java
yum install java-1.8.0-openjdk.x86_64 -y

# Download and Install Jenkins
yum update –y
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y


# Enable and start Jenkins with systemctl
systemctl enable jenkins --now

# Install Git SCM
yum install git -y

# Make sure Jenkins comes up/on when reboot
chkconfig jenkins on