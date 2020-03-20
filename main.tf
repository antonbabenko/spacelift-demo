provider "aws" {
  region = "eu-west-1"
}

resource "random_pet" "this" {
  length = 2
}

module "log_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket                         = "logs-${random_pet.this.id}"
  acl                            = "log-delivery-write"
  force_destroy                  = true
  attach_elb_log_delivery_policy = true
}
