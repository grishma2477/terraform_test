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

resource "aws_instance" "myserver" {
    ami = "ami-091138d0f0d41ff90"
    instance_type = "t3.micro"

    tags = {
        Name = "Sample Server"
    }
}