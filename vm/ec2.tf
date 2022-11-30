module "cms_key" {
  source                  = "../modules/terraform-aws-kms"
  enable_key_rotation     = true
  deletion_window_in_days = 7
  name                    = var.name
  tags = var.tags
}

//Provides Keypair in Secrets Manager for accessing ec2 instances
module "keypair" {
  source = "../modules/terraform-aws-secrets-manager-keypair"
  name   = var.name
}

//Provides EC2 instance profile for using SSM
module "ec2_profile" {
  source = "../modules/terraform-aws-ec2-instance-profile"
  name   = var.name
}

// Security group
module "sg" {
  source = "../modules/terraform-aws-security-group"
  name   = var.name
  vpc_id = data.aws_vpcs.shared_vpc.ids[0]
  tags = var.tags
}

module "sg_rules" {
  source            = "../modules/terraform-aws-security-group-rules"
  for_each          = var.security_group_rules
  type              = each.value["type"]
  from_port         = each.value["from_port"]
  to_port           = each.value["to_port"]
  protocol          = each.value["protocol"]
  cidr_blocks       = [each.value["cidr_blocks"]]
  rule_description  = each.value["description"]
  security_group_id = module.sg.sg_id
}

module "ec2" {
  source = "../modules/terraform-aws-ec2"
  name                   = var.name
  ami                    = var.ami
  instance_type          = var.instance_type
  #device_name            = var.device
  subnet_id              = data.aws_subnets.private_a.ids[0]
  vpc_security_group_ids = [module.sg.sg_id]
  iam_instance_profile   = module.ec2_profile.ec2_profile_id
  key_name               = module.keypair.key_name
  kms_key_id             = module.cms_key.key_arn
  enable_backup          = true // if you do not want backup of EC2 then make it false
  tags                   = var.tags
}


# ######Below code to add EBS volume.
# resource "aws_ebs_volume" "ebs_volume_01" {
#   encrypted          = true
#   availability_zone  = "us-east-1d"
#   size               = "500"
#   tags = {
#     Name = "${var.name}-data-volume"
# }
# }

# resource "aws_volume_attachment" "ebs_attachment_01" {
#   device_name = "/dev/sdd"
#   volume_id   = aws_ebs_volume.ebs_volume_01.id
#   instance_id = module.ec2.id
# }