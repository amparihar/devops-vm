variable "name" {
  description = "Security group name"
  type        = string
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to add to supported resources"
  type        = map(string)
}