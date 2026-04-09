#key pair(login)
resource aws_key_pair my_key{
    key_name = "${var.env}-terra-key-ec2-new"
    public_key = file("terra-key-ec2.pub")
    tags = {
      Environment = var.env
    }
}

#VPC & security group
resource aws_default_vpc default{

}
 resource aws_security_group my_security_group{
    name = "${var.env}-automate-sgroup"
    description = "this will add a TF generated security group"
    vpc_id = aws_default_vpc.default.id      #interploation---in whcih we can  extarct, inherit value from terraform block
    

#inbound rule
ingress{
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  description = "SSH Open"
}

#agar kal ko hame port 80 ko access nhi dena h use block krna h to hm
#directly is block ko remove krskete h ya phr cidr block me apna ip adresee de skte h

ingress{
   from_port = 80
   to_port = 80
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
   description = "HTTP open"
}

ingress{
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "flask app"
}
#outbound rule
egress{
    from_port = 0   #0 poert means all port
    to_port = 0
    protocol = "-1" # semantically equivalent to all ports.  port range all mean "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access open outbound"
}

tags ={
        Name = "${var.env}-automate-sg"
        Environment = var.env
    }
 }

#ec2 instance
resource "aws_instance" "my_instance" {
    #count = 2   #meta argument
    for_each = tomap({
    terra-automate-micro-server = "t3.micro"   #instance-1
    terra-automate-medium-server = "t3.micro"  #instance-2
    
    }) #meta argument
    depends_on = [ aws_security_group.my_security_group, aws_key_pair.my_key ]   #meta argument
    key_name = aws_key_pair.my_key.key_name
    security_groups = [ aws_security_group.my_security_group.name ]

    # vpc_security_group_ids = [ aws_default_vpc.default.id ]  #vpc security group me daal di thi to yaha ec2 me daalne ki zaroorat nhi h 
    #instance_type = var.ec2_instance_type
   
    instance_type = each.value
    ami = var.ec2_ami_id   #ubuntu
    user_data = file("install_nginx.sh")   #jab instance craete hoga uske sath nginx bhi install hojayega us file shell script se
    
    root_block_device {
      #volume_size = var.ec2_default_root_block_storage
      volume_size = var.env == "prd" ? 20 : var.ec2_default_root_block_storage
      volume_type = "gp3"
    }

    tags = {
     # Name = "terra-automate123"
       Name = each.key
    }

}

#this is used to connect your manual created server to your terraform 
#resource "aws_instance" "my_new_instance" {
#    ami = "unknown"
#    instance_type = "unknown"
# 
#}