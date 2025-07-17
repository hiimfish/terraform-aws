terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

variable "region" {
  type        = string
  default     = "ap-northeast-2"
  description = "The AWS Region to connect and run the tests in."
}

provider "aws" {
  region = var.region
}

terraform {
  backend "consul" {
    address      = "localhost:8500"
    scheme       = "http"
    path         = "path/to/save/state"
    access_token = "01a56e2d-a96a-4ca5-9d39-d5152015f533"
  }
}