# Terraform AWS VPC Module

This repository contains Terraform modules designed to be straightforward and easy to use for creating and managing AWS Virtual Private Clouds (VPCs). The modules simplify the process of provisioning VPCs with subnets, route tables, and other related resources.

## Features

- Create customizable VPCs.
- Support for public, private, and isolated subnets.
- Configurable CIDR blocks and subnet sizes.
- Automatic creation of route tables and internet gateways.
- Support for NAT gateways.
- Options to enable DNS hostnames and DNS resolution.

## Requirements

- Terraform >= 1.0
- AWS provider >= 4.0

## Modules

This repository includes the following modules:

1. **VPC Module**: Creates a VPC with configurable subnets, route tables, and gateways.
2. **Subnet Module**: Manages public, private, and isolated subnets.
3. **NAT Gateway Module**: Provisions NAT gateways for private subnet internet access.
4. **Flow Log Module**: Enables VPC flow logs for monitoring network traffic.

## Inputs

| Name                     | Description                                              | Type        | Default     | Required |
|--------------------------|----------------------------------------------------------|-------------|-------------|----------|
| `vpc_cidr_block`         | The CIDR block for the VPC                               | string      | `"10.0.0/16"` | yes      |
| `public_subnet_count`    | The number of public subnets to create in the VPC        | number      | `1`         | yes      |
| `private_subnet_count`   | The number of private subnets to create in the VPC       | number      | `1`         | yes      |
| `ips_per_subnet_exponent`| The exponent to calculate the number of IPs per subnet   | number      | `8`         | yes      |
| `tags`                   | A map of tags to assign to the resources                 | map(string) | `{}`        | no       |
| `project_name`           | The name of the project, used for tagging resources      | string      | `""`        | yes      |

## Outputs

| Name                   | Description                              |
|------------------------|------------------------------------------|
| `vpc_id`               | ID of the created VPC                   |
| `public_subnet_ids`    | IDs of the public subnets               |
| `private_subnet_ids`   | IDs of the private subnets              |
| `nat_gateway_ids`      | IDs of the NAT Gateways                 |
| `route_table_ids`      | IDs of the route tables                 |

## Usage

To use this module, include it in your Terraform configuration and provide the required variables. Below is an example of how to call this module:

```
module "vpc" {
    source = "github.com/cloudconsulting/terraform-aws-vpc"

    vpc_cidr_block          = "10.0.0.0/16"
    public_subnet_count     = 2
    private_subnet_count    = 2
    ips_per_subnet_exponent = 8
    tags = {
        Environment = "Development"
        Project     = "SampleProject"
    }
    project_name            = "SampleProject"
}
```

This example creates a VPC with the following configuration:
- CIDR block: `10.0.0.0/16`
- 2 public subnets
- 2 private subnets
- Subnets sized using an exponent of 8
- Tags for environment and project name
- Project name set to "SampleProject"


## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Author

Created by Asaph Tinoco.
