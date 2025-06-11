locals {
  bucket_names = toset(["bucket1", "bucket12", "bucket13", "bucket14", "bucket15"])
}

resource "aws_s3_bucket" "buckets" {
  for_each = local.bucket_names
  bucket   = each.value
  aws_s3_bucket_acl      = "private"
  tags = {
    Name = each.value
  }
}