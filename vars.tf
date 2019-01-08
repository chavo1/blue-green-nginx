variable "access_key" {}
variable "secret_key" {}
variable "aws_security_group" {}

variable "region" {
  default = "us-east-1"
}

output "blue_public_ip" {
  value = "${module.blue.public_ip}"
}

output "green_public_ip" {
  value = "${module.green.public_ip}"
}

output "load_balancer_dns" {
  value = "${aws_elb.elb-blue-green.dns_name}"
}
