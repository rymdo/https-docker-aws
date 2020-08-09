resource "aws_security_group" "public" {
  name        = local.constants.security.public
  description = "[${var.environment}] public"
  vpc_id      = data.aws_vpc.vpc.id
  tags = {
    Name        = local.constants.security.public
    Environment = var.environment
  }
}
