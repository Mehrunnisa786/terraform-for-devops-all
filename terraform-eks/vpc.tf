
#ye local. ngi bhi diye to chalta direct values deskte h. Just to understand local variables concepts we write lke this
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${local.env}-vpc"
  cidr = local.vpc_cidr   #itna range ke public ip banenge

  azs             = local.azs
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets
  intra_subnets   = local.intra_subnets    #cintrol plane manage intranet. #intranet means andar ki dunya

  enable_nat_gateway = true
  enable_vpn_gateway = true
  single_nat_gateway = true 

  public_subnet_tags = {

  }
  tags = {
    Terraform   = "true"
    Environment = local.env
  }
}