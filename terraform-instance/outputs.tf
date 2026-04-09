# output for count
# output "ec2_public_ip" {
#  value = aws_instance.my_instance[*].public_ip   #hmne count =2 kiya mtlb 2 instance create honge tp  #to uske public ip n]bhi alag alag hogi iss liye astrike(*) lagana hota h 
# }

# output "ec2_private_ip" {
#   value = aws_instance.my_instance[*].private_ip
# }

#output "ec2_public_dns" {
#   value = aws_instance.my_instance[*].public_dns
# }

#output for For each
 output "ec2_public_ip" {
  value = [
    for key in aws_instance.my_instance: key.public_ip
  ]
  }

output "ec2_private_ip" {
    value = [
        for key in aws_instance.my_instance: key.private_ip
    ]
 }

output "ec2_public_dns" {
    value = [
        for key in aws_instance.my_instance: key.public_dns
    ]
}
