# Private Routing

resource "aws_route_table" "private" {
  count  = length(var.azs)
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.name}-private-${var.azs[count.index]}"
  }
}

resource "aws_route" "private" {
  count                  = length(var.azs)
  route_table_id         = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.nat.*.id, count.index)
}

# app routing

resource "aws_route_table_association" "app" {
  count          = length(var.azs)
  subnet_id      = element(aws_subnet.app.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

# web routing

resource "aws_route_table_association" "web" {
  count          = length(var.azs)
  subnet_id      = element(aws_subnet.web.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

# data routing

resource "aws_route_table_association" "data" {
  count          = length(var.azs)
  subnet_id      = element(aws_subnet.data.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}


# Public Routing

resource "aws_route_table" "dmz" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.name}-dmz"
  }
}

resource "aws_route" "internet_gateway" {
  route_table_id         = aws_route_table.dmz.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "dmz" {
  count          = length(var.azs)
  subnet_id      = element(aws_subnet.dmz.*.id, count.index)
  route_table_id = aws_route_table.dmz.id
}
