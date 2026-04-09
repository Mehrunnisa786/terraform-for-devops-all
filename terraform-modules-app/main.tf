#dev infrastructure

module "dev-infra" {
    source = "./infra-app"
    env = "dev"
    bucket_name = "infra-app-bucket"
    instance_count = 1
    instance_type = "t3.micro"
    ec2_ami_id = "ami-07062e2a343acc423"   #ubuntu
    hash-key = "studentID"  
}

module "prd-infra" {
    source = "./infra-app"
    env = "prd"
    bucket_name = "infra-app-bucket"
    instance_count = 2
    instance_type = "t3.micro"
    ec2_ami_id = "ami-07062e2a343acc423"   #ubuntu
    hash-key = "studentID"  
}


module "stg-infra" {
    source = "./infra-app"
    env = "stg"
    bucket_name = "infra-app-bucket"
    instance_count = 1
    instance_type = "t3.micro"
    ec2_ami_id = "ami-07062e2a343acc423"   #ubuntu
    hash-key = "studentID"  
}
