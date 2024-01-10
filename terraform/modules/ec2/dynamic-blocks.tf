#https://www.cloudbolt.io/terraform-best-practices/terraform-dynamic-blocks/
data "aws_vpc" "default" {
  default = true
}
locals {
  inbound_ports  = [80, 443]
  outbound_ports = [443, 1433]
}

# Security Groups
resource "aws_security_group" "sg-webserver" {
  vpc_id      = data.aws_vpc.default.id
  name        = "webserver"
  description = "Security Group for Web Servers"
  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = local.outbound_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = [data.aws_vpc.default.cidr_block]
    }
  }
}
