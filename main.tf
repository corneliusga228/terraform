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

# resource "aws_lambda_function" "gateway-dynamodb-get" {
#    description = ""
#   function_name = "gateway-dynamodb-get"
#   handler = "lambda_function.lambda_handler"
#   architectures = [
#        "x86_64"
#    ]
#    s3_bucket = "prod-04-2014-tasks"
#    s3_key = "/snapshots/682420599557/gateway-dynamodb-get-8f7c75b0-ba1c-4669-9fd3-f5b4491545d8"
#    s3_object_version = "YJvj_MgLBnRu6rfKitogDhp7SZ96xEwu"
#    memory_size = 128
#    role = "arn:aws:iam::682420599557:role/DynamoDB-Stream-Lambda-role-student"
#    runtime = "python3.9"
#    timeout = 3
#    tracing_config {
#        mode = "PassThrough"
#    }
#}

#resource "aws_lambda_function" "openai_gpt" {
#    description = ""
#    environment {
#        variables {
#            OPENAI_API_KEY = "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"
#        }
#    }
#    function_name = "openai_gpt"
#    handler = "lambda_function.lambda_handler"
#   architectures = [
#       "x86_64"
#   ]
#    s3_bucket = "prod-04-2014-tasks"
#    s3_key = "/snapshots/682420599557/openai_gpt-01145755-7c18-4497-a9e6-e95422c3f5b7"
#    s3_object_version = "ZyHOgjahOr5PoiOSCSzC9LnpmlEB_zQ4"
#    memory_size = 128
#    role = "arn:aws:iam::682420599557:role/service-role/openai_gpt-role-kszndsu4"
#    runtime = "python3.8"
#    timeout = 15
#    tracing_config {
#        mode = "PassThrough"
#    }
#    layers = [
#        "arn:aws:lambda:us-east-1:682420599557:layer:openai_zip:1"
#    ]
#}

#resource "aws_lambda_function" "proxy-lambda" {
#   description = ""
#    function_name = "proxy-lambda"
#    handler = "lambda_function.lambda_handler"
#    architectures = [
#        "x86_64"
#    ]
#    s3_bucket = "prod-04-2014-tasks"
#    s3_key = "/snapshots/682420599557/proxy-lambda-76b0f9d2-52b6-4f00-af20-5de81fed38bb"
#    s3_object_version = "nsPBY_Qgef4GaIuSFJJVXD66ljHAlUd."
#    memory_size = 128
#    role = "arn:aws:iam::682420599557:role/service-role/proxy-lambda-role-ccdsplvx"
#    runtime = "python3.9"
#    timeout = 3
#    tracing_config {
#        mode = "PassThrough"
#    }
#}

#resource "aws_lambda_function" "openai-prompt" {
#    description = ""
#    environment {
#        variables {
#            OPENAI_API_KEY = "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"
#        }
#    }
#    function_name = "openai-prompt"
#    handler = "lambda_function.lambda_handler"
#    architectures = [
#        "x86_64"
#    ]
#   s3_bucket = "prod-04-2014-tasks"
#   s3_key = "/snapshots/682420599557/openai-prompt-51c6ec25-d077-46ea-b3a9-a0fa2357e8a5"
#    s3_object_version = "Pnf.bm3wy2yR9pSTQY56ShQsHugJ.hsM"
#    memory_size = 128
#   role = "arn:aws:iam::682420599557:role/service-role/openai-prompt-role-usimngem"
#    runtime = "python3.8"
#    timeout = 15
#    tracing_config {
#       mode = "PassThrough"
#    }
#    layers = [
#        "arn:aws:lambda:us-east-1:682420599557:layer:openai_zip:1"
#    ]
#}

#resource "aws_api_gateway_rest_api" "proxy-api" {
#    name = "proxy-api"
#    api_key_source = "HEADER"
#    endpoint_configuration {
#        types = [
#           "REGIONAL"
#        ]
#    }
#}

#resource "aws_lambda_function" "key-extracting-function" {
#    description = ""
#    function_name = "key-extracting-function"
#    handler = "lambda_function.lambda_handler"
#    architectures = [
#        "x86_64"
#    ]
#    s3_bucket = "prod-04-2014-tasks"
#    s3_key = "/snapshots/682420599557/key-extracting-function-df78f376-5ad1-43e9-ac0c-46fde7764dca"
#    s3_object_version = "MJhqXepEsuZNg76MW4TzKx_8xml80drV"
#    memory_size = 128
#    role = "arn:aws:iam::682420599557:role/DynamoDB-Stream-Lambda-role-student"
#    runtime = "python3.9"
#   timeout = 3
#    tracing_config {
#        mode = "PassThrough"
#    }
#}
