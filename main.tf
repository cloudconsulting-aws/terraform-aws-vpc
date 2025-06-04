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
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_block
  map_public_ip_on_launch = true
  tags = merge({
    Name = "${var.project_name}-public-subnet"
  }, var.tags)

}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_block
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
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat" {
  tags = merge({
    Name = "${var.project_name}-nat-eip"
  }, var.tags)
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.id
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
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
