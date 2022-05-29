#  output "ec2_global_ips_jenkins" {
#   value = ["${aws_instance.terraform_antons_EC2_jenkins.*.public_ip}"]
# }

#  output "ec2_local_ips_jenkins" {
#   value = ["${aws_instance.terraform_antons_EC2_jenkins.*.private_ip}"]
# }

 output "ec2_global_ips_ansible" {
  value = ["${aws_instance.terraform_antons_EC2_ansible.*.public_ip}"]
}

 output "ec2_local_ips_ansible" {
  value = ["${aws_instance.terraform_antons_EC2_ansible.*.private_ip}"]
}

 output "ec2_global_ips_tomcat" {
  value = ["${aws_instance.terraform_antons_EC2_tomcat.*.public_ip}"]
}

 output "ec2_local_ips_tomcat" {
  value = ["${aws_instance.terraform_antons_EC2_tomcat.*.private_ip}"]
}

 output "ec2_global_ips_docker" {
  value = ["${aws_instance.terraform_antons_EC2_docker.*.public_ip}"]
}

 output "ec2_local_ips_docker" {
  value = ["${aws_instance.terraform_antons_EC2_docker.*.private_ip}"]
}

 output "ec2_global_ips_nexus" {
  value = ["${aws_instance.terraform_antons_EC2_nexus.*.public_ip}"]
}

 output "ec2_local_ips_nexus" {
  value = ["${aws_instance.terraform_antons_EC2_nexus.*.private_ip}"]
}

