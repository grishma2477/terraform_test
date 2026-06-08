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

locals {
  owner = "ABC"
  name = "MyServer"
}

resource "aws_instance" "name" {
  ami           = "ami-00e801948462f718a"
  instance_type = var.aws_ec2_instance_type

  tags = merge(var.additional_tags, {
    Name = local.name
  })

  root_block_device {
    delete_on_termination = true
    volume_size           = var.aws_volume-size
    volume_type           = "gp2"
  }
  
}