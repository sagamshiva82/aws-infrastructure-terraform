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
  depends_on = [aws_vpc.medicare_retirement_vpc]
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
  depends_on = [aws_security_group.medicare_retirement_sg]
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
  depends_on = [aws_security_group.medicare_retirement_sg]
}

resource "aws_vpc_security_group_egress_rule" "medicare_retirement_outbound_rules" {
  security_group_id = aws_security_group.medicare_retirement_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = -1
  depends_on        = [aws_security_group.medicare_retirement_sg]
}

resource "aws_eip" "medicare_retirement_eip" {
  instance = aws_instance.medicare_retirement_ec2.id
  tags = {
    Name = "${local.project}-eip"
  }
  depends_on = [aws_instance.medicare_retirement_ec2]

}

resource "aws_subnet" "medicare_retirement_subnet" {
  vpc_id     = aws_vpc.medicare_retirement_vpc.id
  cidr_block = "192.168.0.0/28"

  tags = {
    Name = "${local.project}-subnet-A"
  }
  depends_on = [aws_vpc.medicare_retirement_vpc]
}

resource "aws_instance" "medicare_retirement_ec2" {
  ami                         = "ami-0c101f26f147fa7fd"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.medicare_Retirement.key_name
  associate_public_ip_address = true
  security_groups             = [aws_security_group.medicare_retirement_sg.id]
  subnet_id                   = aws_subnet.medicare_retirement_subnet.id
  tags = {
    Name = "${local.project}-ec2"
  }
  depends_on = [aws_key_pair.medicare_Retirement, aws_subnet.medicare_retirement_subnet]
}

resource "aws_internet_gateway" "medicare_retirement_ig" {
  vpc_id = aws_vpc.medicare_retirement_vpc.id
  tags = {
    Name = "${local.project}-ig"
  }
  depends_on = [aws_vpc.medicare_retirement_vpc]

}

resource "aws_route_table" "medicare_retirement_rte" {

  vpc_id = aws_vpc.medicare_retirement_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.medicare_retirement_ig.id
  }
  tags = {
    Name = "${local.project}-rt"
  }
  depends_on = [aws_vpc.medicare_retirement_vpc, aws_internet_gateway.medicare_retirement_ig]
}

resource "aws_route_table_association" "medicare_retirement_rte_ass" {
  subnet_id      = aws_subnet.medicare_retirement_subnet.id
  route_table_id = aws_route_table.medicare_retirement_rte.id
  depends_on     = [aws_subnet.medicare_retirement_subnet, aws_route_table.medicare_retirement_rte]
}

resource "aws_ami_from_instance" "medicare_retirement_ec2_ami" {
  name               = "medicare-retirement-ec2-ami"
  source_instance_id = aws_instance.medicare_retirement_ec2.id
  tags = {
    Name = "medicare-retirement-ec2-ami"
  }

}