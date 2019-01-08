resource "aws_key_pair" "green" {
  key_name   = "green"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
