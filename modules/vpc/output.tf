output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "nat_gateway_ids" {
  value = aws_nat_gateway.nat.*.id
}

output "web_subnet_ids" {
  value = aws_subnet.web.*.id
}

output "app_subnet_ids" {
  value = aws_subnet.app.*.id
}

output "data_subnet_ids" {
  value = aws_subnet.data.*.id
}

output "dmz_subnet_ids" {
  value = aws_subnet.dmz.*.id
}

output "gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "cidr_block" {
  value = aws_vpc.vpc.cidr_block
}

output "data_subnet_cidr_blocks" {
  value = aws_subnet.data.*.cidr_block
}

output "web_subnet_cidr_blocks" {
  value = aws_subnet.web.*.cidr_block
}

output "app_subnet_cidr_blocks" {
  value = aws_subnet.app.*.cidr_block
}

output "dmz_subnet_cidr_blocks" {
  value = aws_subnet.dmz.*.cidr_block
}
