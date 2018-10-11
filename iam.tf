## Admins
resource "aws_iam_group" "admins" {
  name = "Admins"
}

resource "aws_iam_group_membership" "admins" {
  name = "Admins"
  users = [
    "${aws_iam_user.michael_berkowitz.name}"
  ]
  group = "${aws_iam_group.admins.name}"
}

resource "aws_iam_group_policy_attachment" "admins_administrator_access" {
  group = "${aws_iam_group.admins.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

## Dev
resource "aws_iam_group" "dev" {
  name = "Dev"
}

resource "aws_iam_group_membership" "dev" {
  name = "Dev"
  users = [
    "${aws_iam_user.donna.name}",
    "${aws_iam_user.kunal.name}",
    "${aws_iam_user.matt.name}"
  ]
  group = "${aws_iam_group.dev.name}"
}

resource "aws_iam_group_policy_attachment" "dev_s3_full_access" {
  group = "${aws_iam_group.dev.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_group_policy_attachment" "dev_ec2_full_access" {
  group = "${aws_iam_group.dev.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
resource "aws_iam_group_policy_attachment" "dev_rds_full_access" {
  group = "${aws_iam_group.dev.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
}

