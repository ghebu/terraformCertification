##first option



resource "aws_instance" "web" {
  for_each      = toset(["name1", "name2", "name3"])
  ami           = "ami-0005e0cfe09cc9050"
  instance_type = "t3.micro"

  tags = {
    Name = each.key
  }

}

variable "instance_names" {
  default     = ["name1", "name2", "name3"]
  type        = list(any)
  description = "Var containing EC2 instance names"
}

output "debug" {
  value = {
    for key, name in var.instance_names : key => aws_instance.web[name].public_ip
  }
}


output "public_ip_addresses" {
  value = {
    for k, n in var.instance_names : k => "Instance ${n} Public IP: ${aws_instance.web[n].public_ip}"
  }
}

