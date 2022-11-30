resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name_prefix = "${var.name}-keypair"
  public_key      = tls_private_key.this.public_key_openssh
}

resource "aws_secretsmanager_secret" "this" {
  name_prefix = "${var.name}-secret"
  description = "SSH keypair for ${var.name} instance"
  tags = {
    Name = "${var.name}-key"
  }
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = tls_private_key.this.private_key_pem
}