## Requirements

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
| [aws_instance.web](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/instance) | resource |
| [aws_instance.web1](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/instance) | resource |
| [aws_instance.web2](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/resources/instance) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/5.31.0/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami"></a> [ami](#input\_ami) | The AMI Id to be used for the creation of EC2 instance | `string` | `"ami-0005e0cfe09cc9050"` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | COUNT 2nd Example | `bool` | `false` | no |
| <a name="input_instance_names"></a> [instance\_names](#input\_instance\_names) | Var containing EC2 instance names | `list(any)` | <pre>[<br>  "name1",<br>  "name2",<br>  "name3"<br>]</pre> | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | `"t3.micro"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_for_example"></a> [for\_example](#output\_for\_example) | n/a |
| <a name="output_public_ip_addresses"></a> [public\_ip\_addresses](#output\_public\_ip\_addresses) | n/a |
| <a name="output_splat_expression_example"></a> [splat\_expression\_example](#output\_splat\_expression\_example) | n/a |
