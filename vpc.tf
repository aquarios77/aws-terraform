# Create a VPC
resource "aws_vpc" "tf-vpc" {
    cidr_block = var.cidr_block[0]
    tags = {
        Name  = "terraform-vpc"
     }
}

# Create a subnet (Public)
resource "aws_subnet" "tf-vpc-sn-pub-a" {
    vpc_id = aws_vpc.tf-vpc.id # attaching to the vpc to which the subnet belongs to
    cidr_block = var.cidr_block[1]
    availability_zone = "eu-north-1a"
    map_public_ip_on_launch = true
    tags = {
        Name = "terraform-vpc-public-subnet-a"
    }
}

# Create Internet GW, to allow communication between the VPC and Internet (to and from)
resource "aws_internet_gateway" "tf-vpc-igw" {
    vpc_id = aws_vpc.tf-vpc.id # attaching the IGW to the VPC
    tags = {
        Name = "terraform-vpc-igw"
    }
}


# Create a routing table
resource "aws_route_table" "tf-vpc-rt-pub-a" {
 vpc_id = aws_vpc.tf-vpc.id
 route {
  cidr_block = var.cidr_block[2] # route all over this IGW
  gateway_id = aws_internet_gateway.tf-vpc-igw.id
 }
 tags = {
  Name = "terraform-route-to-subnet-a"
 }
}

# Create subnet and route table association
resource "aws_route_table_association" "tf-vpc-rt-asoc-pub-a" {
 subnet_id = aws_subnet.tf-vpc-sn-pub-a.id
 route_table_id = aws_route_table.tf-vpc-rt-pub-a.id
}
