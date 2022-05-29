# define terraform environmnet
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>3.0"
        }
    }
}

# configure the AWS provide
provider "aws" {
	region="eu-north-1"
#        endpoints {
#		    sts = "https://sts.eu-north-1.amazonaws.com" 	 
#	}
	profile="default"
}

# # create the EC2 instance with Jenkins server
# resource "aws_instance" "terraform_antons_EC2_jenkins" {
#   ami = var.ami
#   instance_type = var.instance_type
#   count = 1
#   key_name = var.key_pair
#   subnet_id = aws_subnet.tf-vpc-sn-pub-a.id
#   vpc_security_group_ids = [aws_security_group.default-tf-sg.id]
#   associate_public_ip_address = true
#   user_data = file("./InstallJenkins.sh") # will be place into /var/lib/cloud/instances/<instance-id>/user-data.txt
#   # the log is palce in the /var/log/cloud-init-output.log

#   tags = {
# 	  Name = "Terraform EC2 Jenkins Server"
#   }
# }

# create the EC2 instance as Ansible control node
resource "aws_instance" "terraform_antons_EC2_ansible" {
  ami = var.ami
  instance_type = var.instance_type
  count = 1
  key_name = var.key_pair
  subnet_id = aws_subnet.tf-vpc-sn-pub-a.id
  vpc_security_group_ids = [aws_security_group.default-tf-sg.id]
  associate_public_ip_address = true
  user_data = file("./InstallAnsibleCN.sh") # will be place into /var/lib/cloud/instances/<instance-id>/user-data.txt
  # the log is palce in the /var/log/cloud-init-output.log

  tags = {
	  Name = "Ansible Control Node"
  }
}

# create the EC2 instance for Apache tomcat
resource "aws_instance" "terraform_antons_EC2_tomcat" {
  ami = var.ami
  instance_type = var.instance_type
  count = 1
  key_name = var.key_pair
  subnet_id = aws_subnet.tf-vpc-sn-pub-a.id
  vpc_security_group_ids = [aws_security_group.default-tf-sg.id]
  associate_public_ip_address = true
  user_data = file("./AnsibleManagedNode.sh") # will be place into /var/lib/cloud/instances/<instance-id>/user-data.txt
  # the log is palce in the /var/log/cloud-init-output.log

  tags = {
	  Name = "Ansible Managed Tomcat"
  }
}

# create the EC2 instance for Docker
resource "aws_instance" "terraform_antons_EC2_docker" {
  ami = var.ami
  instance_type = var.instance_type
  count = 1
  key_name = var.key_pair
  subnet_id = aws_subnet.tf-vpc-sn-pub-a.id
  vpc_security_group_ids = [aws_security_group.default-tf-sg.id]
  associate_public_ip_address = true
  user_data = file("./Docker.sh") # will be place into /var/lib/cloud/instances/<instance-id>/user-data.txt
  # the log is palce in the /var/log/cloud-init-output.log

  tags = {
	  Name = "Managed Node Docker"
  }
}

# create the EC2 instance for Sonatype Nexus - repository manager - stores all the build artificats (like for example snapshots)
resource "aws_instance" "terraform_antons_EC2_nexus" {
  ami = var.ami
  instance_type = var.instance_type
  count = 1
  key_name = var.key_pair
  subnet_id = aws_subnet.tf-vpc-sn-pub-a.id
  vpc_security_group_ids = [aws_security_group.default-tf-sg.id]
  associate_public_ip_address = true
  user_data = file("./InstallNexus.sh") # will be place into /var/lib/cloud/instances/<instance-id>/user-data.txt
  # the log is palce in the /var/log/cloud-init-output.log

  tags = {
	  Name = "Sonatype Nexus"
  }
}


