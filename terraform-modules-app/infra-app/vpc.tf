# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest
#from this doc
#modules are reusable code.  
#modules is like template whcih has all the resource block everything is written We just have to put variables 
#jab bhi modules likhte h source likhna bht zaroori h

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-auto-vpc"
  cidr = "10.0.0.0/16"   #itna range ke public ip banenge

  azs             = ["us-east-2a", "us-east-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = var.env
      }
}