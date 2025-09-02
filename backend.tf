terraform {
  backend "s3" {
    bucket = "demosimplebucket-2c4520850506bd0a"
    key    = "backend.tfstate"
    region = "eu-north-1"
    dynamodb_table = "LockTable"
  }
}