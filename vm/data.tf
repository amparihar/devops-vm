locals {
    region = var.aws_regions[var.aws_region]
}

data "aws_vpcs" "shared_vpc" {
  tags = {
    Name = format("vpc-shared-%s-tflz", local.region)
  }
}

data "aws_subnets" "private_a" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.shared_vpc.ids[0]]
  }

  tags = {
    Name = format("sub-shared-main-private-%sa-tflz", local.region)
  }
}

data "aws_subnets" "private_b" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.shared_vpc.ids[0]]
  }

  tags = {
    Name = format("sub-shared-main-private-%sb-tflz", local.region)
  }
}