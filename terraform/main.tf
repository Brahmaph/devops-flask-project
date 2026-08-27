terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.6.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "devops_demo" {
  bucket = var.bucket_name

  tags = {
    Name        = "devops-demo"
    Environment = "dev"
  }
}
