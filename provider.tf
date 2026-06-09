  terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "6.36.0"
      }
    }

    backend "s3" {
      bucket   = "remote-state-aws-dev-bucket-245758552785-us-east-1-an"     # Bucket name
      key      = "roboshop-dev-vpc"      
      region   = "us-east-1"
      encrypt  = true
      use_lockfile = true
    }
  }

  provider "aws" {
    region = "us-east-1"
  }