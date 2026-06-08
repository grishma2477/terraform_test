This is complete config to work with this module. 

USAGE 
```
provider "aws" {
    region = "ap-southeast-2a"
}

module "vpc" {
    source = "./module/vpc"

    vpc_config = {
        cidr_block = "10.0.0.0/16"
        name = "my-test-vpc"
    }

    subnet_config = {
    
      public_subnet = {
        cidr_block = "10.0.0.0/24"
        az = "ap-southeast-2a"
        public = true
      }

      private_subnet = {
        cidr_block = "10.0.1.0/24"
        az = "ap-southeast-2a"
      }
    }
}
