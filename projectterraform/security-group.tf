resource "aws_security_group" "web" {

  name        = "${var.instance_name}-sg"

  description = "Allow HTTP"

  vpc_id      = data.aws_vpc.default.id

}

 

resource "aws_vpc_security_group_ingress_rule" "http" {

  security_group_id = aws_security_group.web.id

  cidr_ipv4         = "0.0.0.0/0"

  from_port         = 80

  to_port           = 80

  ip_protocol       = "tcp"

}

 

resource "aws_vpc_security_group_egress_rule" "all_out" {

  security_group_id = aws_security_group.web.id

  cidr_ipv4         = "0.0.0.0/0"

  ip_protocol       = "-1"

}