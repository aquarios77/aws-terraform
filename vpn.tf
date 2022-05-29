# resource "aws_ec2_client_vpn_endpoint" "antons-vpn" {
#   description            = "terraform-clientvpn-example"
#   server_certificate_arn = "arn:aws:acm:eu-north-1:873619198957:certificate/af5672c5-b3a0-4c9c-9b95-30ed4fb51e01" # server certificate
#   client_cidr_block      = var.cidr_block[4]

#   authentication_options {
#     type                       = "certificate-authentication"
#     root_certificate_chain_arn = "arn:aws:acm:eu-north-1:873619198957:certificate/2c74dcb9-8e15-40ed-8e78-a3d6c33c4979" # client certificate
#   }

#      connection_log_options {
#      enabled = false
#    }
# }

# resource aws_ec2_client_vpn_network_association private {
#    client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.antons-vpn.id
#    subnet_id              = aws_subnet.tf-vpc-sn-pub-a.id
#  }

#  resource null_resource client_vpn_ingress {
#    depends_on = [aws_ec2_client_vpn_endpoint.antons-vpn]
#    provisioner "local-exec" {
#      when    = create
#      command = "aws ec2 authorize-client-vpn-ingress --client-vpn-endpoint-id ${aws_ec2_client_vpn_endpoint.antons-vpn.id} --target-network-cidr 0.0.0.0/0 --authorize-all-groups"
#    }
#    lifecycle {
#      create_before_destroy = true
#    }
#  }

#  resource null_resource client_vpn_route_table {
#    depends_on = [aws_ec2_client_vpn_endpoint.antons-vpn]
#    provisioner "local-exec" {
#      when = create
#      command = "aws ec2 create-client-vpn-route --client-vpn-endpoint-id ${aws_ec2_client_vpn_endpoint.antons-vpn.id} --destination-cidr-block 0.0.0.0/0  --target-vpc-subnet-id ${aws_subnet.tf-vpc-sn-pub-a.id}"
#    }
#    lifecycle {
#      create_before_destroy = true
#    }
#  }

#  resource null_resource client_vpn_security_group {
#    depends_on = [aws_ec2_client_vpn_endpoint.antons-vpn]
#    provisioner "local-exec" {
#      when = create
#      command = "aws ec2 apply-security-groups-to-client-vpn-target-network --client-vpn-endpoint-id ${aws_ec2_client_vpn_endpoint.antons-vpn.id} --vpc-id ${aws_security_group.vpn_access.vpc_id} --security-group-ids ${aws_security_group.vpn_access.id}"
#    }
#    lifecycle {
#      create_before_destroy = true
#    }
#  }