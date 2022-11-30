variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}



variable "subnet_id" {
  type = string
}

variable "vpc_security_group_ids" {

}

variable "iam_instance_profile" {
  type = string
}

variable "key_name" {
  type = string
}

variable "kms_key_id" {
  type = string
}

variable "name" {
  type = string
}

variable "enable_backup" {
  type = string
}

variable "tags" {
  default     = {}
  description = "Tags to add to supported resources"
  type        = map(string)
}

