terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 6.0"
      }
    }
}

provider "aws" {
    region = "us-east-1"
}


resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my_vpc"
    }
}

resource "aws_subnet" "private_subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.my-vpc.id
    tags = {
        Name = "private_subnet"
    }
}

resource "aws_subnet" "public_subnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.my-vpc.id
    tags = {
        Name = "public_subnet"
    }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = "my_igw"
  }
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }
}

resource "aws_route_table_association" "public_subnet_association" {
    route_table_id = aws_route_table.my_route_table.id
    subnet_id = aws_subnet.public_subnet.id
}

resource "aws_instance" "myserver" {
    ami = "ami-00e801948462f718a"
    instance_type = "t2.small"
    subnet_id = aws_subnet.public_subnet.id 
    
    tags = {
        Name = "Sample Server"
    }
}