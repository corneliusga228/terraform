terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "CostarCapstone"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "listings-terraform"{
  name = "Listings"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "ListingID"
  
  attribute {
    name = "ListingID"
    type = "N"
  }
}
resource "aws_dynamodb_table" "extracted-keys" {
  name = "extracted-keys"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "ListingID"
  
  attribute {
     name = "ListingID"
     type = "N"
  }
}

resource "aws_dynamodb_table" "openai-prompt-result" {
  name = "openai-prompt-result"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "ListingID"
  
  attribute {
     name = "ListingID"
     type = "N"
  }
}
