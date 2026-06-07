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

resource "aws_instance" "myserver" {
    ami = "ami-0e3fa6b36f33f1eee"
    instance_type = "t2.small"

    tags = {
        Name = "Sample Server"
    }
}