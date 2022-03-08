output "public_key" {
  value = aws_key_pair.terraform_key
  description = "Content of generated key"

}
