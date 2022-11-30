variable "type" {
  description = "type"
  type        = string
}

variable "from_port" {
  description = "from_port"
  type        = string
}

variable "to_port" {
  description = "to_port"
  type        = string
}

variable "protocol" {
  description = "protocol"
  type        = string
}

variable "cidr_blocks" {
  description = "cidr_blocks"
}

variable "rule_description" {
  description = "rule description"
  type        = string
}

variable "security_group_id" {
  description = "security_group_id"
  type        = string
}