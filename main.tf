terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "dadgarcorp"

    workspaces {
      name = "cli-targeting"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

resource "aws_s3_bucket" "aaa_bucket" {
  bucket = "nomitch_aaa_bucket_aaa"
  acl = "private"
}

resource "aws_s3_bucket" "bbb_bucket" {
  bucket = "nomitch_bbb_bucket_bbb"
  acl = "private"
}

resource "aws_security_group" "no_xgress" {
  description = "Public group no xgress rules"
}
