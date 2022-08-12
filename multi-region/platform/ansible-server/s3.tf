resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "codepipeline-ansible-ktech-br"
  acl    = "private"

  versioning {
    enabled = true
  }
}
