resource "aws_vpc" "medicare_retirement_vpc" {
  cidr_block                       = "192.168.0.0/24"
  assign_generated_ipv6_cidr_block = true
  tags = {
    Name = "${local.project}-vpc"
  }
}

resource "aws_security_group" "medicare_retirement_sg" {
  name        = "medicare-retirement-sg"
  description = "Security group for medicare retirement app servers"
  vpc_id      = aws_vpc.medicare_retirement_vpc.id
  tags = {
    Name = "${local.project}-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "medicare_retirement_inbound_rules_tcp" {
  security_group_id = aws_security_group.medicare_retirement_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  tags = {
    Name = "${local.project}-inbound-rules-tcp"
  }
}

resource "aws_vpc_security_group_ingress_rule" "medicare_retirement_inbound_rules_ssh" {
  security_group_id = aws_security_group.medicare_retirement_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  tags = {
    Name = "${local.project}-inbound-rules-ssh"
  }
}

resource "aws_vpc_security_group_egress_rule" "medicare_retirement_outbound_rules" {
  security_group_id = aws_security_group.medicare_retirement_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = -1
}
