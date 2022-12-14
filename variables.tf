variable "aws_region"{
    type = string
}

variable "aws_regions" {
    type = map(string)
}

variable "s3_backend_bucket_name" {
    type    = string
}

variable "lock_table_name" {
    type    = string
} 