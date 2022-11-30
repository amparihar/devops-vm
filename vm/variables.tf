variable "aws_region"{
    type = string
}

variable "aws_regions" {
    type = map(string)
}

 variable "application" {
  type    = string
}

variable "name" {
  type    = string
  description = "enter server name" 
}

variable "ami" {
  type    = string
}

variable "instance_type" {
  type    = string
}

variable "security_group_rules" {
  type = map(object({
    description = string
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = any

  }))

  default = {
    "rule_1" = {
      description = "allow 443"
      type        = "ingress"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = "10.0.0.0/8"
    },
    "rule_4" = {
      description = "allow 80"
      type        = "ingress"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = "10.0.0.0/8"
    },
    
    "rule_2" = {
      description = "allow RDP 3389"
      type        = "ingress"
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      cidr_blocks = "10.0.0.0/8"
    },
    "rule_3" = {
      description      = "allow outbond everything"
      type             = "egress"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = "0.0.0.0/0"
      ipv6_cidr_blocks = ["::/0"]
    }
  }
}

variable "tags" {
  type = map(string)
}