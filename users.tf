resource "aws_iam_user" "michael_berkowitz" {
  name = "michael.berkowitz"
  force_destroy = true
}

resource "aws_iam_user" "donna" {
  name = "Donna"
  force_destroy = true
}

resource "aws_iam_user" "kunal" {
  name = "Kunal"
  force_destroy = true
}

resource "aws_iam_user" "matt" {
  name = "Matt"
  force_destroy = true
}
