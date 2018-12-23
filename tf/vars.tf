variable "app_name" {
  default = "goserver"
}

variable "region" {
  default = "eu-west-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "jmarques"
}

data "aws_ami" "ami" {
  owners      = ["self"]
  most_recent = true

  filter {
    name   = "name"
    values = ["goserver-*"]
  }
}

variable "asg" {
  default = {
    desired_capacity = 1
    max_size         = 1
    min_size         = 1
  }
}
