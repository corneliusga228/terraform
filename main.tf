terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
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

resource "aws_dynamodb_table" "listings"{
  name = "Listings"
  hash_key = "ListingID"
  
  attribute {
    name = "ListingId"
    type = "N"
  }
}
resource "aws_dynamodb_table" "extracted-keys"{
  name = "extracted-keys"
  hash_key = "ListingID"
  
  attribute {
    name = "ListingId"
    type = "N"
  }
}
resource "aws_dynamodb_table" "openai-prompt-result"{
  name = "Listings"
  hash_key = "ListingID"
  
  attribute {
    name = "ListingId"
    type = "N"
  }
}
