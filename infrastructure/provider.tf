terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = "~> 6.0" # This is the provider version
    }
  }
  required_version = "1.13.4" # This is the terraform version
}

provider "aws" {
  region = var.region
}
