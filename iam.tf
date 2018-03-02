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
