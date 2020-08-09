resource "aws_security_group" "developer" {
  name        = local.constants.security.developer
  description = "[${var.environment}] developer"
  vpc_id      = data.aws_vpc.vpc.id
  tags = {
    Name        = local.constants.security.developer
    Environment = var.environment
  }
}

resource "aws_security_group_rule" "developer_ssh_ingress" {
  for_each = toset(var.developer_ssh_cidrs)

  description       = "SSH [${each.value}]"
  security_group_id = aws_security_group.developer.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [each.value]
}

resource "aws_security_group_rule" "developer_ssh_egress" {
  for_each = toset(var.developer_ssh_cidrs)

  description       = "SSH [${each.value}]"
  security_group_id = aws_security_group.developer.id
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [each.value]
}
