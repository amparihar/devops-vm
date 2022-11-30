resource "aws_security_group" "this" {
  name        = "${var.name}-sg" //Name of SG
  description = "$This Sg is for ${var.name}-sg application "
  vpc_id      = var.vpc_id

  tags = var.tags

}