resource "aws_vpc" "default" {
  cidr_block = "172.31.0.0/16"
}

resource "aws_vpc" "essentials" {
  cidr_block = "172.32.0.0/24"

  tags {
    Name = "essentials"
  }
}

resource "aws_internet_gateway" "essentials" {
  vpc_id = "${aws_vpc.essentials.id}"

  tags {
    Name = "essentials"
  }
}
