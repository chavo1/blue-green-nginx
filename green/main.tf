resource "aws_instance" "green" {
  ami           = "ami-0ef93494ca3b2cc4d"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.green.id}"
  count         = 1

  connection {
    user        = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source      = "asset"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/asset/setup-web.sh",
      "sudo /tmp/asset/setup-web.sh",
    ]
  }
}

output "ec2_instance_id" {
  value = "${aws_instance.green.*.id}"
}

output "public_ip" {
  value = "${aws_instance.green.*.public_ip}"
}
