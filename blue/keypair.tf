resource "aws_key_pair" "blue" {
  key_name   = "blue"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
