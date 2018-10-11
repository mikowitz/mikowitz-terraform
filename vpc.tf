resource "aws_vpc" "default" {
  cidr_block = "172.31.0.0/16"
}

resource "aws_vpc" "essentials" {
  cidr_block = "172.32.0.0/24"

  tags {
    Name = "essentials"
    role = "essentials"
  }
}

resource "aws_internet_gateway" "essentials" {
  vpc_id = "${aws_vpc.essentials.id}"

  tags {
    Name = "essentials"
    role = "essentials"
  }
}

resource "aws_network_acl" "essentials" {
  vpc_id = "${aws_vpc.essentials.id}"

  tags {
    Name = "essentials"
    role = "essentials"
  }
}

resource "aws_network_acl_rule" "essentials_ingress_all" {
  network_acl_id = "${aws_network_acl.essentials.id}"
  rule_number = 100
  rule_action = "allow"
  egress = false
  protocol = -1
  from_port = 0
  to_port = 0
  cidr_block = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "essentials_egress_all" {
  network_acl_id = "${aws_network_acl.essentials.id}"
  rule_number = 100
  rule_action = "allow"
  egress = true
  protocol = -1
  from_port = 0
  to_port = 0
  cidr_block = "0.0.0.0/0"
}

resource "aws_route_table" "essentials_public" {
  vpc_id = "${aws_vpc.essentials.id}"

  tags {
    Name = "essentials-public"
    role = "essentials"
  }
}

resource "aws_route" "essentials_public_igw" {
  route_table_id = "${aws_route_table.essentials_public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.essentials.id}"
}

resource "aws_route_table" "essentials_private" {
  vpc_id = "${aws_vpc.essentials.id}"

  tags {
    Name = "essentials-private"
    role = "essentials"
  }
}

