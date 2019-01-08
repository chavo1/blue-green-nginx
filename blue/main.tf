resource "aws_instance" "blue" {
  ami           = "ami-07647a0c080280f47"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.blue.id}"
  count         = 0

  connection {
    user        = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
  }
}

output "ec2_instance_id" {
  value = "${aws_instance.blue.*.id}"
}

output "public_ip" {
  value = "${aws_instance.blue.*.public_ip}"
}
