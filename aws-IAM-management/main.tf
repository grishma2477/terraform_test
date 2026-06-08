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
  users_data = yamldecode(file("./users.yaml")).users
}

output "output" {
  value = local.users_data[*].username
}

#creating users 
resource "aws_iam_user" "main" {
    for_each = toset(local.users_data[*].username)
  name = each.value
}

#Password Creation
resource "aws_iam_user_login_profile" "profile" {
    for_each = aws_iam_user.main
    user = each.value.name
    password_length = 12

    lifecycle {
      ignore_changes = [ 
        password_length,
        password_reset_required,
        pgp_key,
       ]
    }
}