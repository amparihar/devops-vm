provider "aws" {

  region = var.aws_regions[var.aws_region]
  
}

module "backend" {
  source = "./modules/s3-backend"
  s3_backend_bucket_name  = var.s3_backend_bucket_name
  lock_table_name         = var.lock_table_name
  
}