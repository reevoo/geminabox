locals {
  common_tags = {
    Application = "geminabox"
    Environment = "production"
    Managed     = "Terraform"
    Repo        = "https://github.com/reevoo/geminabox"
  }

  vpc_id          = "vpc-2ca6c945"
}

