terraform {
  backend "s3" {
    bucket = "my-tf-bucket0001"
    key    = "backend.tfstate"
    region = "eu-north-1"
    dynamodb_table = "LockTable"
  }
}