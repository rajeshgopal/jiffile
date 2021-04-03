resource "aws_vpc_dhcp_options" "dhcp1" {
  count               = var.domain_name_servers == "none" ? 0 : 1
  domain_name         = "test.internal"
  domain_name_servers = split(",", var.domain_name_servers)

  tags = {
    Name = "custom-dns"
  }
}

resource "aws_vpc_dhcp_options_association" "dns_resolver" {
  count           = var.domain_name_servers == "none" ? 0 : 1
  vpc_id          = aws_vpc.vpc.id
  dhcp_options_id = aws_vpc_dhcp_options.dhcp1[0].id
}

