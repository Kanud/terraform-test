provider "aws" {
    region = "us-east-1"
    access_key = "AKIAW52UJVNR7D6TKM7M"
    secret_key = "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" 
}
   
variable "cidr_block" {
    description = "vpc cidr block"
}
resource "aws_vpc" "first_vpc" {
    cidr_block = var.cidr_block
    tags = {
        Name = "our_first_vpc"
    }

}

resource "aws_subnet" "first_subnet" {
    vpc_id = aws_vpc.first_vpc.id
    availability_zone = "us-east-1a"
    cidr_block = "10.0.0.0/28"
    tags = {
        Name = "our_first_vpc"
        }

}

resource "aws_instance" "my_first_ec2" {
    ami = "ami-0f34c5ae932e6f0e4"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.first_subnet.id
    tags = {
        Name = "our_first_ec2"
    }
}