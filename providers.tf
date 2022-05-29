terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.33.0"
      region  = "us-east-1"
    }
  }
  backend "s3" {
    bucket = "bitcoin-price-monitor-terraform-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
