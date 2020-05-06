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

resource "aws_security_group" "foo_security_group" {
  name        = "public_sg"
  description = "Public group"

  ingress {
    from_port   = 80
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "no_gress" {
  name        = "no_gress"
  description = "Public group no xgress rules"
}
