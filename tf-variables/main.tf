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

resource "aws_instance" "name" {
  ami           = "ami-00e801948462f718a"
  instance_type = "t2.small"

  tags = {
    Name = "Sample Server"
  } 

  root_block_device {
    delete_on_termination = true
    volume_size           = var.aws_volume-size
    volume_type           = "gp2"
  }
  
}