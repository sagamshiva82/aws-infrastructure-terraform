terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.82.2"
    }
    tls = {
      source  = "registry.terraform.io/hashicorp/tls"
      version = "~>4.0"
    }
  }
  required_version = "~>1.17.0"
}