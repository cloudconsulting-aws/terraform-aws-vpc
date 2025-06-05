variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0/16"
}

variable "public_subnet_count" {
  description = "The number of public subnets to create in the VPC."
  type        = number
  default     = 1
}

variable "private_subnet_count" {
  description = "The number of private subnets to create in the VPC."
  type        = number
  default     = 1
}

variable "ips_per_subnet_exponent" {
  description = "The exponent to calculate the number of IP addresses per subnet (e.g., 2^exponent)."
  type        = number
  default     = 8
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
