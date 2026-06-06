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

resource "aws_s3_bucket" "demo-bucket" {
    bucket = "demo-bucket-abcdg1234"

}

resource "aws_s3_object" "bucket-data"{
    bucket = aws_s3_bucket.demo-bucket.bucket 
    source = "./myfile.txt"
    key = "mydata.txt"
}