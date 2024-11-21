provider "aws" {
  region =  "us-east-1"
}


#this block is used to create security group
resource "aws_security_group" "security_group" {
  name        = "vpc_project_SG"
  description = "Allow inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "VPC_SG"
  }
}


#this block is used to create inbound rule for security group 
#ingress= inbound
#egress= outbound 

resource "aws_vpc_security_group_ingress_rule" "allow_ipv4_rule1" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = var.cidr
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_ipv4_rule2" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = var.cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}



