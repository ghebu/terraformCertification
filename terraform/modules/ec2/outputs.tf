output "debug" {
  value = aws_instance.web.public_ip
}

output "public ip" {
  value = "EC2 Instance Public IP ${aws_instance.web.public_ip}"
}