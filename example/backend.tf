terraform {
  backend "s3" {
    bucket       = "infras-terraform-tfstate"
    key          = "modules/terraform-aws-vpc/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
