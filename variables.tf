variable "cidr_block" {
    type = list(string)
    default = ["172.20.0.0/16","172.20.10.0/24","0.0.0.0/0","89.221.115.199/32","10.5.0.0/20"]
}

variable "ports" {
    type = list(number)
    default = [22,80,443,8080,8081]
}

variable "ami" {
    type = string
    default = "ami-08bdc08970fcbd34a"
} 

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "key_pair" {
    type = string
    default = "eu-north-key-pair"
}

variable "instance_name" {
    type = string
    default = "terraform_antons_EC2"
}