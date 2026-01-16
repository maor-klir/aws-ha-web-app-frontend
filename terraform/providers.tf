terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.27"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.1.0"
    }
  }

  cloud {
    organization = "maor"
    workspaces {
      name = "aws-ha-web-app-frontend"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
