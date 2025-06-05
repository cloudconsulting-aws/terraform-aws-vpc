resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge({
    Name = "${var.project_name}-vpc"
  }, var.tags)
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = merge({
    Name = "${var.project_name}-internet-gateway"
  }, var.tags)

}

resource "aws_subnet" "public" {
  for_each                = toset([for i in range(var.public_subnet_count) : cidrsubnet(var.vpc_cidr_block, var.ips_per_subnet_exponent, i)])
  vpc_id                  = aws_vpc.main.id
  cidr_block              = each.value
  map_public_ip_on_launch = true
  tags = merge({
    Name = "${var.project_name}-public-subnet"
  }, var.tags)

}

resource "aws_subnet" "private" {
  for_each   = toset([for i in range(var.private_subnet_count) : cidrsubnet(var.vpc_cidr_block, var.ips_per_subnet_exponent, i)])
  vpc_id     = aws_vpc.main.id
  cidr_block = each.value
  tags = merge({
    Name = "${var.project_name}-private-subnet" },
    var.tags
  )

}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = merge({
    Name = "${var.project_name}-route-table-public"
  }, var.tags)

}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_route_table_association" "public" {
  for_each       = { for idx, subnet in aws_subnet.public : idx => subnet }
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat" {
  tags = merge({
    Name = "${var.project_name}-nat-eip"
  }, var.tags)
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  # Getting the first public subnet for NAT Gateway
  subnet_id = values(aws_subnet.public)[0].id
  tags = merge({
    Name = "${var.project_name}-nat-gateway"
  }, var.tags)

}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = merge({
    Name = "${var.project_name}-route-table-private"
  }, var.tags)

}

resource "aws_route" "private_internet_access" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main.id
}

resource "aws_route_table_association" "private" {
  for_each       = { for idx, subnet in aws_subnet.private : idx => subnet }
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}
