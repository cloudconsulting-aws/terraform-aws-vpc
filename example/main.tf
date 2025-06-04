module "vpc" {
  source                    = "../"
  vpc_cidr_block            = var.vpc_cidr_block
  public_subnet_cidr_block  = var.public_subnet_cidr_block
  private_subnet_cidr_block = var.private_subnet_cidr_block
  tags                      = var.tags
  project_name              = var.project_name
}
