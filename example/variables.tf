variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet."
  type        = string
  default     = "10.0.2.0/24"
}

variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}

variable "project_name" {
  description = "The name of the project, used for tagging resources."
  type        = string
  default     = "main"
}
