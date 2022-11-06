## Terraform Playground

I'm using this space to just build something and iterate over while I learn new parts of terraform

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.75.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_application"></a> [ec2\_application](#module\_ec2\_application) | ./modules/module_eastaugh_ec2 | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/module_eastaugh_vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_infra_env"></a> [infra\_env](#input\_infra\_env) | Infrastructure environment | `string` | `"dev"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_eip"></a> [app\_eip](#output\_app\_eip) | The public IP address of the web instance |
<!-- END_TF_DOCS -->