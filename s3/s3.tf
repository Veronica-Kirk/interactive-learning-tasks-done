resource "aws_s3_bucket" "onebucket" {
   bucket = "aws-s3-devops-task-veronica-kirk"
   acl = "private"
   versioning {
      enabled = true
   }
   tags = {
     Team = "DevOps"
     Environment = "Dev"
   }
}