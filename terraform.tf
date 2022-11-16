terraform {
  required_version = "~> 1.0.9"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      aws    = "~> 3.0"
      local  = "~> 1.3"
    }
  }
}