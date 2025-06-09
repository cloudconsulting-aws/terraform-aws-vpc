locals {
  total_subnets        = var.private_subnet_count + var.public_subnet_count
  public_subnet_cidrs  = [for i in range(var.public_subnet_count) : cidrsubnet(var.vpc_cidr_block, var.ips_per_subnet_exponent, i)]
  private_subnet_cidrs = [for i in range(var.public_subnet_count, local.total_subnets) : cidrsubnet(var.vpc_cidr_block, var.ips_per_subnet_exponent, i)]
}
