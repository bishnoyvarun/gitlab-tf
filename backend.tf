terraform {
  backend "s3" {
    bucket = "demosimplebucket-5f70fcf255f8f675"
    key    = "backend.tfstate"
    dynamodb_table = "LockTable"
    region = "eu-north-1"
    encrypt = true
  }
}