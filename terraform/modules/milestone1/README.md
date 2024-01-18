# Milestone1

**Part 1**: (Terraform infra/network component)

- Create a **VPC** with 3 **subnets** (1 public, 2 private)
- Setup an **EC2** instance within a private subnet
- Setup a **bastion host** within the public subnet
- Create a **NAT Gateway** for private subnet routing
- Create an **Internet Gateway**## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.31.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.31.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.nat](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/eip) | resource |
| [aws_instance.bastion](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/instance) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.ngw](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/nat_gateway) | resource |
| [aws_network_interface.bastion](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/network_interface) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route_table) | resource |
| [aws_route_table.public_subnet](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/route_table_association) | resource |
| [aws_security_group.bastion](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/security_group) | resource |
| [aws_subnet.milestone](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/subnet) | resource |
| [aws_vpc.milestone](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subnets_map"></a> [subnets\_map](#input\_subnets\_map) | n/a | `map` | <pre>{<br>  "1": [<br>    "public-subnet",<br>    "true"<br>  ],<br>  "2": [<br>    "private-subnet-1",<br>    "false"<br>  ],<br>  "3": [<br>    "private-subnet-2",<br>    "false"<br>  ]<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastionIP"></a> [bastionIP](#output\_bastionIP) | n/a |
