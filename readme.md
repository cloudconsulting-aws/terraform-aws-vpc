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
| `tags`                 | Tags to apply to resources              | map    | `{}`    | no       |

## Outputs

| Name                   | Description                              |
|------------------------|------------------------------------------|
| `vpc_id`               | ID of the created VPC                   |
| `public_subnet_ids`    | IDs of the public subnets               |
| `private_subnet_ids`   | IDs of the private subnets              |
| `nat_gateway_ids`      | IDs of the NAT Gateways                 |
| `route_table_ids`      | IDs of the route tables                 |

## License

This project is licensed under the Apache License 2.0. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## Author

Created by Asaph Tinoco.
