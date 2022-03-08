output "DNS" {
  value = aws_instance.web.public_dns
}

output "IP" {
  value = aws_instance.web.public_ip
}

output "ID" {
  value = aws_instance.web.id
}