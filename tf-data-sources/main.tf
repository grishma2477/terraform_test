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

data "aws_ami" "name" {
  most_recent = true
  owners = ["amazon"]
}

output "aws_ami" {
    value = data.aws_ami.name.id
}

data "aws_security_group" "name" {
    tags = {
        mywebserver = "http"
    }
}

data "aws_security_group" "id" {
    id = data.aws_security_group.name.id
}

data "aws_vpc" "name" {
    tags = {
        ENV = "PROD"
        Name = "my-vpc"
    }
}

output "vpc_id" {
    value = data.aws_vpc.name.id
}

#AZ 
data "aws_availability_zones" "names" {
    state = "available"
}

output "aws_zones" {
    value = data.aws_availability_zones.names
}

### to get the account details
data "aws_caller_identity" "name" {

}

output "caller_info" {
    value = data.aws_caller_identity.name
}

##to find region details
data "aws_region" "name" {

}

output "region_name" {
  value = data.aws_region.name.name
}

resource "aws_instance" "myserver" {
    ami = data.aws_ami.name.id
    instance_type = "t2.small"

    tags = {
        Name = "Sample Server"
    }
}