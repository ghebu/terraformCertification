variable "subnets_map" {
  default = {
    "1" : ["public-subnet", "true"]
    "2" : ["private-subnet-1", "false"]
    "3" : ["private-subnet-2", "false"]
  }
}

# output "debug" {
#   value = aws_subnet.milestone.1.id
# }

output "bastionIP" {
    value = "curl ${aws_instance.bastion.public_ip}"
}
