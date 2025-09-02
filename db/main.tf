## DynamoDB Table
#provider "aws" {
#  region  = "eu-north-1"
#  #profile = "vakky_devpos"
#}

#resource "aws_dynamodb_table" "my_table" {
#  name           = "LockTable"
#  billing_mode   = "PAY_PER_REQUEST"  # On-demand pricing
#  hash_key       = "LockId"

#  attribute {
#    name = "LockId"
#    type = "S"  # S = String, N = Number, B = Binary
#  }

#  tags = {
#    Environment = "dev"
#    Terraform   = "true"
#  }
#}