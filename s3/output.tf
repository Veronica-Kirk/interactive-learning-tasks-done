output "bucket_arn" {
  value       = aws_s3_bucket.onebucket.*.arn
  description = "S3 bucket ARN"
}
