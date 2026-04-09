variable "env" {
    description = "This is the environment for my infra"
    type = string 
}

variable "bucket_name" {
    description = "This is the bucket for my infra"
    type = string 
}

variable "instance_count" {
    description = "This is the no. of ec2 instance"
    type = number
  
}
variable "instance_type" {
    description = "This is the instance type for my infra"
    type = string
}

variable "ec2_ami_id" {
    description = "This is the ami id for my infra"
    type = string
  
}
variable "hash-key" {
    description = "This is the hash key for my infra app"
    type = string
  
}