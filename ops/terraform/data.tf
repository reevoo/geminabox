data "aws_route53_zone" "reevoocloud" {
  name         = "reevoocloud.com."
  private_zone = false
}

data "aws_subnet" "main-private-1a" {
  id = "subnet-e8611181"
}

data "aws_subnet" "main-private-1b" {
  id = "subnet-cc6111a5"
}

data "aws_subnet" "main-private-1c" {
  id = "subnet-c76111ae"
}
