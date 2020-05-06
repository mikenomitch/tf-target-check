provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_vpc" "foo_vpc" {
  cidr_block = "10.10.0.0/16"
}

resource "aws_vpc" "bar_vpc" {
  cidr_block = "10.10.0.0/16"
}

resource "aws_s3_bucket" "baz_bucket" {
  bucket = "baz"
  acl = "private"
}

resource "aws_s3_bucket" "qux_bucket" {
  bucket = "qux"
  acl = "private"
}
