# Terraform AWS VPC Module

This repository contains a Terraform module for creating and managing an AWS Virtual Private Cloud (VPC). The module simplifies the process of provisioning a VPC with subnets, route tables, security groups, and other related resources.

## Features

- Create a customizable VPC.
- Support for public, private, and isolated subnets.
- Configurable CIDR block and subnet sizes.
- Automatic creation of route tables and internet gateways.
- Support for NAT gateways, security groups, and flow logs.
- Option to enable DNS hostnames and DNS resolution.

## Requirements

- Terraform >= 1.0
- AWS provider >= 4.0

## Usage

```hcl
module "vpc" {
    source = "./modules/vpc"

    vpc_name            = "my-vpc"
    cidr_block          = "10.0.0.0/16"
    public_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets     = ["10.0.3.0/24", "10.0.4.0/24"]
    isolated_subnets    = ["10.0.5.0/24"]
    enable_nat_gateway  = true
    enable_dns_support  = true
    enable_dns_hostnames = true
    flow_log_destination = "cloud-watch-logs"
    tags = {
        Environment = "production"
    }
}
```

## Inputs

| Name                   | Description                              | Type   | Default | Required |
|------------------------|------------------------------------------|--------|---------|----------|
| `vpc_name`             | Name of the VPC                         | string | `""`    | yes      |
| `cidr_block`           | CIDR block for the VPC                  | string | `""`    | yes      |
| `public_subnets`       | List of public subnet CIDR blocks       | list   | `[]`    | yes      |
| `private_subnets`      | List of private subnet CIDR blocks      | list   | `[]`    | yes      |
| `isolated_subnets`     | List of isolated subnet CIDR blocks     | list   | `[]`    | no       |
| `enable_nat_gateway`   | Enable NAT Gateway                      | bool   | `false` | no       |
| `enable_dns_support`   | Enable DNS resolution in the VPC         | bool   | `true`  | no       |
| `enable_dns_hostnames` | Enable DNS hostnames in the VPC          | bool   | `true`  | no       |
| `flow_log_destination` | Destination for VPC flow logs           | string | `""`    | no       |
| `tags`                 | Tags to apply to resources              | map    | `{}`    | no       |

## Outputs

| Name                   | Description                              |
|------------------------|------------------------------------------|
| `vpc_id`               | ID of the created VPC                   |
| `public_subnet_ids`    | IDs of the public subnets               |
| `private_subnet_ids`   | IDs of the private subnets              |
| `isolated_subnet_ids`  | IDs of the isolated subnets             |
| `nat_gateway_ids`      | IDs of the NAT Gateways                 |
| `route_table_ids`      | IDs of the route tables                 |
| `flow_log_id`          | ID of the VPC flow log                  |

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Author

Created by Cloud Consulting Team.
