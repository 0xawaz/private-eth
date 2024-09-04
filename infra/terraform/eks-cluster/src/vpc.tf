data "aws_availability_zones" "available" { }

locals {
  azs = [
    data.aws_availability_zones.available.names[0],
    data.aws_availability_zones.available.names[1]
  ]
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.1"

  name                 = var.vpc_name
  cidr                 = var.vpc_cidr

  azs                  = local.azs
  private_subnets      = var.private_subnets
  public_subnets       = var.public_subnets
  

  enable_nat_gateway     = true
  single_nat_gateway     = true
  create_egress_only_igw = true
  one_nat_gateway_per_az = false

  enable_dns_hostnames   = true
  enable_dns_support     = true

  tags = local.tags

  public_subnet_tags = {
    "kubernetes.io/role/elb"                          = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb"                 = "1"
  }
}