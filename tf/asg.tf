# Define a launch-config for this role:
resource "aws_launch_configuration" "app" {
  name_prefix                 = "${var.app_name}-"
  image_id                    = "${data.aws_ami.ami.image_id}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  security_groups             = ["${aws_security_group.app.id}"]
  enable_monitoring           = false
  associate_public_ip_address = false
  user_data                   = "#!/bin/server"

  lifecycle {
    create_before_destroy = true
  }
}

# Define an autoscaling-group:
resource "aws_autoscaling_group" "app" {
  name                      = "${var.app_name}"
  max_size                  = "${var.asg["max_size"]}"
  min_size                  = "${var.asg["min_size"]}"
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = "${var.asg["desired_capacity"]}"
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.app.name}"
  vpc_zone_identifier       = ["${aws_default_subnet.default_az1.id}", "${aws_default_subnet.default_az2.id}", "${aws_default_subnet.default_az3.id}"]
  target_group_arns         = ["${aws_lb_target_group.app.arn}"]

  tag {
    key                 = "Name"
    value               = "${var.app_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }
}
