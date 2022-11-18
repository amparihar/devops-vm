terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0, < 4.0"
    }
  }
  backend "s3" {
    region         = var.aws_regions[var.aws_region]
    bucket         = "homelabs-state"      
    key            = "homelabs/vm"    
    dynamodb_table = "homelabs-vm-lock-table" //Name of DynamoDB Lock Table 
    encrypt        = true
    
  }
}