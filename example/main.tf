data "aws_availability_zones" "azs" {
  state = "available"
}

module "vpc" {
  source                  = "../"
  vpc_cidr_block          = "10.0.0.0/16"
  public_subnet_count     = 2
  private_subnet_count    = 2
  ips_per_subnet_exponent = 8
  project_name            = "example-project"
  availability_zones      = data.aws_availability_zones.azs.names
  tags = {
    Environment = "example"
    Owner       = "example-owner"
  }
}
