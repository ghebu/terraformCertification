## FOR EACH
resource "aws_instance" "web" {
  for_each      = toset(var.instance_names)
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name = each.key
  }

}

## FOR can be seen inside outputs.tf

## COUNT and TERNARY OPERATOR
#COUNT 1st Example

resource "aws_instance" "web1" {
  count         = 1
  ami           = var.ami != null ? var.ami : data.aws_ami.ubuntu.id
  instance_type = var.instance_type
}



#COUNT 2nd Example
variable "enabled" {
  type    = bool
  default = false
}

resource "aws_instance" "web2" {
  count         = var.enabled ? 1 : 0
  ami           = var.ami
  instance_type = var.instance_type
}
