variable "name" {
  description = "Prefix to add to keypair/secret name"
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to add to supported resources"
  type        = map(string)
}