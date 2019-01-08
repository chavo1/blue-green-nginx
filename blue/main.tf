resource "aws_instance" "blue" {
  ami           = "ami-04169656fea786776"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.blue.id}"
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
      "chmod +x /tmp/asset/setup-blue.sh",
      "sudo /tmp/asset/setup-blue.sh",
    ]
  }
}

output "ec2_instance_id" {
  value = "${aws_instance.blue.*.id}"
}

output "public_ip" {
  value = "${aws_instance.blue.*.public_ip}"
}
