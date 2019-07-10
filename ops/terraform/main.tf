terraform {
  required_version = ">= 0.11.13, < 0.12"
  region           = "eu-west-1"

  backend "s3" {
    region = "us-east-1"
    bucket = "reevoo-tfstate-20180430140716217900000001"
    key    = "geminabox/geminabox-production.tfstate"
  }
}

provider "aws" {
  version = "~> 2.5.0 "
  region  = "eu-west-1"
}

resource "aws_security_group" "efs-sg" {
  vpc_id      = "vpc-2ca6c945"
  name        = "geminabox-efs"
  description = "geminabox EFS"

  tags = "${merge(local.common_tags, map(
    "Name", "geminabox-efs"
    ))}"
}

