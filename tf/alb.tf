resource "aws_lb" "app" {
  name               = "${var.app_name}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.app_alb.id}"]
  subnets            = ["${aws_default_subnet.default_az1.id}", "${aws_default_subnet.default_az2.id}", "${aws_default_subnet.default_az3.id}"]

  tags = {
    Terraform = true
  }
}

resource "aws_lb_listener" "app" {
  load_balancer_arn = "${aws_lb.app.id}"
  port              = "80"
  protocol          = "HTTP"

  #   ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  #   certificate_arn   = "${data.aws_acm_certificate.certificate.arn}"

  default_action {
    target_group_arn = "${aws_lb_target_group.app.id}"
    type             = "forward"
  }
}

resource "aws_lb_target_group" "app" {
  name     = "${var.app_name}-target-1323"
  port     = 1323
  protocol = "HTTP"
  vpc_id   = "${aws_default_vpc.default.id}"

  health_check {
    path = "/version"
  }
}

output "alb_ip" {
  value = "${aws_lb.app.dns_name}"
}
