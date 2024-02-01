terraform {
   backend "s3" {
    region         = "us-east-2"
    bucket         = "homelabs-vm-tf-state"      
    key            = "homelabs/vm"    
    dynamodb_table = "homelabs-vm-tf-lock-table" //Name of DynamoDB Lock Table 
    encrypt        = true
    }
}
 
 