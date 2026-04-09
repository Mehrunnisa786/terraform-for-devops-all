#https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
#https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest

#hmne yaha ek eks ka cluster banaya aur use vpc ke through uske control plane ko intarsubnet diya. Phr node group banaya and t3.micro diya aur usko cluster t]ke sath add krdiya
#cni - cluster network interface

module "eks"{
  
  #import the module template(line10,11)
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"    #module version agara nhi doge to ye current version lelega

  #cluster addons 
  addons = {     #Map of attribute maps for all EKS cluster addons enabled in the cluster. The key of the map is the name of the addon, and the value is a map of attributes for that addon. The following attributes are supported for each addon:
    coredns                = {
        most-recent = true
    }
    eks-pod-identity-agent = {
        most-recent = true
    }
    kube-proxy             = {
        most-recent = true
    }
    vpc-cni                = {
        most-recent = true
    }
  }

  #cluster info(control plane)
  name = local.name
  kubernetes_version = "1.33"

  endpoint_public_access = true
  enable_cluster_creator_admin_permissions = true
  
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets     #private subnet because we have to keep the control plane internal
  
  #control plane network 
  control_plane_subnet_ids = module.vpc.intra_subnets
  
  # EKS Managed Node Group(s)- managing nods in the cluster
  eks_managed_node_groups= {    #eks nodes group me bata skte konse konse type ke nodes chahiye
    cluster-ng = {
      instance_types = ["t3.micro"]
      attach_cluster_primary_security_group = true   #iss se cluster ke security group me added rahenege aur koi bhi node attach hoskata h 
    
      min_size     = 2   #min 2 instance will craete
      max_size     = 3   #max 3 instance will create
      desired_size = 2

      capacity_type = "SPOT"
    }
  }

  tags = {
    Environment = local.env
    Terraform   = "true"
  }

}

