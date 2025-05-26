variable "region" {
  description = "AWS region"
  type        = string
  default = "us-east-1"
}
variable "key_pair" {
  default     = "lightfeather-keypair"
  description = "Name of the file"
}
variable "key" {
  default     = "lightfeather-keypair"
  description = "Name of the file"
}

variable "private_subnets" {
  type = list(string)
  default = []
}
