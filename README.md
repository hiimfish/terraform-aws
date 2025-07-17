# My Module

This is where you'd put a description of the module.

## Usage

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                   | Version |
| ------------------------------------------------------ | ------- |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | ~> 6.0  |

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | 6.0.0   |

## Modules

No modules.

## Resources

| Name                                                                                                             | Type        |
| ---------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_instance.hello_world](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource    |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)             | data source |

## Inputs

| Name                                                                     | Description                                       | Type     | Default      | Required |
| ------------------------------------------------------------------------ | ------------------------------------------------- | -------- | ------------ | :------: |
| <a name="input_subnet_id"></a> [subnet_id](#input_subnet_id)             | The ID of the Subnet to launch the instance into. | `string` | n/a          |   yes    |
| <a name="input_instance_type"></a> [instance_type](#input_instance_type) | The type of instance to launch.                   | `string` | `"t3.micro"` |    no    |

## Outputs

| Name                                                                                | Description                                                       |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| <a name="output_aws_instance"></a> [aws_instance](#output_aws_instance)             | The entire instance resource.                                     |
| <a name="output_aws_instance_arn"></a> [aws_instance_arn](#output_aws_instance_arn) | The AWS Resource Name for the instance.                           |
| <a name="output_aws_instance_ip"></a> [aws_instance_ip](#output_aws_instance_ip)    | The IP Address for the private network interface on the instance. |

<!-- END_TF_DOCS -->
