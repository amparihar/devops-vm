variable "s3_backend_bucket_name" {
    
    type    = string
}

variable "lock_table_name" {
    
    type    = string
}

variable "tags" {
  type        = map(any)
  default     = {}
  
}
