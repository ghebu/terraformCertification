output "debug" {
  value = aws_subnet.milestone.1.id
}

output "bastionIP" {
    value = "curl ${aws_instance.bastion.public_ip}"
}