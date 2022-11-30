terraform {
   backend "s3" {
    region         = var.aws_regions[var.aws_region]
    bucket         = "homelabs-state"      
    key            = "homelabs/vm"    
    dynamodb_table = "homelabs-vm-lock-table" //Name of DynamoDB Lock Table 
    encrypt        = true
    }
}
 
 