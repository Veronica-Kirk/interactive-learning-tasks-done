output "vpc_arn" {
  value       = aws_vpc.aws_vpc.*.arn
  description = "vpc bucket ARN"
}

output "vpc_id" {
  description = "My_VPC_ID"
  value       = aws_vpc.aws_vpc.id
}