#terraform {
#  backend "s3" {
#    bucket = "my-tf-test-bucket"
#    key    = "backend.tfstate"
#    region = "eu-north-1"
#    dynamodb_table = "LockTable"
#  }
#}