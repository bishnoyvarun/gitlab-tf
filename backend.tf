terraform {
  backend "s3" {
    bucket = "demosimplebucket-2c4520850506bd0a"
    key    = "backend.tfstate"
    dynamodb_table = "LockTable"
    region = "eu-north-1"
    encrypt = true
  }
}