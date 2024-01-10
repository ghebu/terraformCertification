##first option

locals {
  tags = {
    Name      = "Hello World"
    Terraform = "True"
  }
}


resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type

  tags = local.tags

}

