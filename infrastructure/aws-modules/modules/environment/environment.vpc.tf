data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.environment]
  }
  filter {
    name   = "tag:Environment"
    values = [var.environment]
  }
}
