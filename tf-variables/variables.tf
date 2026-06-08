variable "aws_volume-size" {
  type = number 
  description = "This is default EC2 volume size." 
#   default = 20

  validation {
    condition = var.aws_volume-size==20 || var.aws_volume-size==25
    error_message = "Only 20 OR 25 is allowed."
  }
}

variable "aws_ec2_instance_type" {
    type = string
    description = "The type of EC2 instance to use"
    validation {
    condition = var.aws_ec2_instance_type== "t2.small" || var.aws_ec2_instance_type=="t3.micro"
    error_message = "Only t2.small and t3.micro allowed."
    }
}

variable "additional_tags" {
    type = map(string) # expecting keyvalue format 
    default = {
      
    }
}