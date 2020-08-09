resource "aws_security_group" "developer" {
  name        = local.constants.security.developer
  description = "[${var.environment}] developer"
  vpc_id      = data.aws_vpc.vpc.id
  tags = {
    Name        = local.constants.security.developer
    Environment = var.environment
  }
}
