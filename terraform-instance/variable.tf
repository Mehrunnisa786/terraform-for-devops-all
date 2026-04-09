
variable "ec2_instance_type" {    #yaha variable type name kch bhi likh skte
    default = "t3.micro"
    type = string
  
}

variable "ec2_ami_id" {
    default = "ami-07062e2a343acc423"
    type = string
}

variable "ec2_default_root_block_storage" {
    default = 10
    type = number
  
}

#Conditional expression
variable "env" {
    default = "dev" 
    type = string
}
