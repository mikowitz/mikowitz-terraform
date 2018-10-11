resource "aws_subnet" "public_1a" {
  vpc_id = "${aws_vpc.essentials.id}"
  cidr_block = "172.32.0.0/26"
  availability_zone = "us-east-1a"

  tags {
    Name = "essentials public us-east-1a"
    region = "us-east-1a"
    role = "essentials"
  }
}

resource "aws_subnet" "public_1b" {
  vpc_id = "${aws_vpc.essentials.id}"
  cidr_block = "172.32.0.64/26"
  availability_zone = "us-east-1b"

  tags {
    Name = "essentials public us-east-1b"
    region = "us-east-1b"
    role = "essentials"
  }
}

resource "aws_subnet" "private_1c" {
  vpc_id = "${aws_vpc.essentials.id}"
  cidr_block = "172.32.0.128/26"
  availability_zone = "us-east-1c"

  tags {
    Name = "essentials private us-east-1c"
    region = "us-east-1c"
    role = "essentials"
  }
}

resource "aws_subnet" "private_1d" {
  vpc_id = "${aws_vpc.essentials.id}"
  cidr_block = "172.32.0.192/26"
  availability_zone = "us-east-1d"

  tags {
    Name = "essentials private us-east-1d"
    region = "us-east-1d"
    role = "essentials"
  }
}

resource "aws_route_table_association" "public_1a" {
  subnet_id = "${aws_subnet.public_1a.id}"
  route_table_id = "${aws_route_table.essentials_public.id}"
}

resource "aws_route_table_association" "public_1b" {
  subnet_id = "${aws_subnet.public_1b.id}"
  route_table_id = "${aws_route_table.essentials_public.id}"
}

resource "aws_route_table_association" "private_1c" {
  subnet_id = "${aws_subnet.private_1c.id}"
  route_table_id = "${aws_route_table.essentials_private.id}"
}

resource "aws_route_table_association" "private_1d" {
  subnet_id = "${aws_subnet.private_1d.id}"
  route_table_id = "${aws_route_table.essentials_private.id}"
}
