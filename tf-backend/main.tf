terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 6.0"
      }
    }
    backend "s3" {
        bucket = "demo-bucket-eb1d4003c8adb994"
        key = "terraform.tfstate"
        region = "us-east-1"
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "myserver" {
    ami = "ami-00e801948462f718a"
    instance_type = "t2.small"

    tags = {
        Name = "Sample Server"
    }
}