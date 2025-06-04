variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet."
  type        = string
}

variable "private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "project_name" {
  description = "The name of the project, used for tagging resources."
  type        = string
}
