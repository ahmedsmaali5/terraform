terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1" # -------------- important !! 
}

resource "aws_s3_bucket" "example" {
  bucket = "my-unique-s3-bucket-name-12345"
}
