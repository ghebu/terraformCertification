output "for_example" {
  value = {
    for key, name in var.instance_names : key => aws_instance.web[name].public_ip
  }
}


output "public_ip_addresses" {
  value = {
    for k, n in var.instance_names : k => "Instance ${n} Public IP: ${aws_instance.web[n].public_ip}"
  }
}


output "splat_expression_example" {
  value = [for name in var.instance_names : aws_instance.web[name].public_ip]
}
