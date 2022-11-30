resource "aws_instance" "this" {
  ami                     = var.ami //AMI for the EC2 Instance
  instance_type           = var.instance_type
  subnet_id               = var.subnet_id              //Subnet in which the EC2 instance should run
  vpc_security_group_ids  = var.vpc_security_group_ids //Security Group ID
  iam_instance_profile    = var.iam_instance_profile
  key_name                = var.key_name //Key_name from ./modules/terraform-secretsmanager-keypair
  disable_api_termination = false        // change back to true

  root_block_device {
    volume_size           = 100
    encrypted             = true
    # device_name           = var.device_name
    kms_key_id            = var.kms_key_id // key_arn from module "cmk" (cmk.tf)
    delete_on_termination = false
    volume_type           = "gp2"
    tags = merge(var.tags, {
      Name         = "${var.name}-root-volume"
      backup-daily = "true" //Tag for AWS Backup
      Description  = "${var.name}-root-volume"
    })
  }

  tags = merge(var.tags, {
    Name         = var.name
    backup-daily = var.enable_backup //Tag for AWS Backup
    Description  = var.name
  })
}