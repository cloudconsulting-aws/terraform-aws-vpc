output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [for assoc in aws_subnet.public : assoc.id]
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [for assoc in aws_subnet.private : assoc.id]
}

output "nat_gateway_ids" {
  description = "The IDs of the NAT Gateways"
  value       = aws_nat_gateway.main[*].id
}

output "public_route_table_ids" {
  description = "The IDs of the public route tables"
  value       = [for assoc in aws_route_table_association.public : assoc.id]
}

output "private_route_table_ids" {
  description = "The IDs of the private route tables"
  value       = [for assoc in aws_route_table_association.private : assoc.id]
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}
