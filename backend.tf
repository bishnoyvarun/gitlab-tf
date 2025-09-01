terraform {
  backend "s3" {
    bucket = "demosimplebucket-ed9f0d64527d15bd"
    key    = "backend.tfstate"
    region = "eu-north-1"
    dynamodb_table = "LockTable"
  }
}