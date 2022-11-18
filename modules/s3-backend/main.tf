

resource "aws_s3_bucket" "this" {
  bucket        = var.s3_backend_bucket_name
  force_destroy = true
  lifecycle {
    prevent_destroy = false //change it to true
  }
  tags = var.tags
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_policy" "this" {
  bucket = aws_s3_bucket.this.id

  policy = <<POLICY
{
  "Statement": [
    {
      "Sid": "tf-state-bucket-delete-protection",
      "Action": [
        "s3:DeleteBucket"
      ],
      "Effect": "Deny",
      "Resource": "arn:aws:s3:::${var.s3_backend_bucket_name}",
      "Principal": {
        "AWS": [
          "*"
        ]
      }
    }
  ]
}
POLICY

  lifecycle {
    ignore_changes = [
      policy
    ]
  }
}

#############################
#--- DynamoDB State Lock ---#
#############################

resource "aws_dynamodb_table" "this" {
  name         = var.lock_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  lifecycle {
    prevent_destroy = false //change it to true
    ignore_changes = [
      read_capacity,
      write_capacity
    ]
  }
  tags = var.tags
}
