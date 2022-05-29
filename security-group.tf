# Create a security group (virtual firewall) allowing incoming SSH access and all outgoing
resource "aws_security_group" "default-tf-sg"{
    name="allow-ssh"
    description="Allow incoming SSH and all outgoing"
    vpc_id = aws_vpc.tf-vpc.id # attach the SG to the VPS

    # dynamic block definition for inbound connections
    dynamic ingress { 
        iterator = port
        for_each  = var.ports
            content {
                from_port = port.value
                to_port = port.value
                protocol  = "tcp"
                cidr_blocks = [var.cidr_block[2], var.cidr_block[3], var.cidr_block[4]]
            }
     
    }

   # ingress {
   #     from_port = "-1" # all ports
   #    to_port = "-1"
   #     protocol = "icmp"
   #     cidr_blocks = [var.cidr_block[2]] # from all
   # }


    egress { # allow all outbound connections
        from_port = 0
        to_port   = 0
        protocol  = "-1" # all protocols
        cidr_blocks = [var.cidr_block[2]]
    }

     tags = {
        Name = "allow-secure-ssh-and-all-outbound"
    }
}

resource aws_security_group vpn_access {
   name = "shared-vpn-access"
   vpc_id = aws_vpc.tf-vpc.id
   ingress {
     from_port = 0
     protocol = "-1"
     to_port = 0
     cidr_blocks = ["0.0.0.0/0"]
   }
   egress {
     from_port = 0
     protocol = "-1"
     to_port = 0
     cidr_blocks = ["0.0.0.0/0"]
   }
 }