resource "aws_security_group" "app" {
  name        = "${var.app_name}"
  description = "For ${var.app_name} instances"
  vpc_id      = "${aws_default_vpc.default.id}"

  tags {
    Name = "${var.app_name}"
  }

  ingress {
    from_port       = 1323
    to_port         = 1323
    protocol        = "tcp"
    security_groups = ["${aws_security_group.app_alb.id}"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "app_alb" {
  name        = "${var.app_name}-alb"
  description = "For ${var.app_name} ALB"
  vpc_id      = "${aws_default_vpc.default.id}"

  tags {
    Name = "${var.app_name}-alb"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
