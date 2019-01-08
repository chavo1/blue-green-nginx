provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_elb" "elb-blue-green" {
  instances          = ["${concat(module.blue.ec2_instance_id, module.green.ec2_instance_id)}"]
  security_groups    = ["${var.aws_security_group}"]
  availability_zones = ["us-east-1a", "us-east-1b"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  tags = {
    Name = "blue-green-elb"
  }
}

#blue
module "blue" {
  source = "blue"
}

#green
module "green" {
  source = "green"
}
