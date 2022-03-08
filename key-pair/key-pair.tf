resource "aws_key_pair" "terraform_key" {
  key_name   = "ilearning-wordpress"
  public_key = file("~/.ssh/id_rsa.pub")
}
