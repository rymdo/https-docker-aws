data "aws_security_group" "developer" {
  filter {
    name   = "tag:Environment"
    values = [var.environment]
  }
  filter {
    name   = "tag:Name"
    values = [local.constants.security.developer]
  }
}

data "aws_security_group" "public" {
  filter {
    name   = "tag:Environment"
    values = [var.environment]
  }
  filter {
    name   = "tag:Name"
    values = [local.constants.security.public]
  }
}
