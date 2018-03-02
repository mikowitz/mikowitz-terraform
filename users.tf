resource "aws_iam_user" "michael_berkowitz" {
  name = "michael.berkowitz"
  force_destroy = true
}

resource "aws_iam_user" "michael" {
  name = "Michael"
  force_destroy = true
}
