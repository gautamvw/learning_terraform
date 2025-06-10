module "website_s3_bucket" {
  source = "../modules/public_s3_bucket_static_website"

  bucket_name = "<BUCKET NAME>"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
#bucket name to be changed to a variable when passed from a pipeline