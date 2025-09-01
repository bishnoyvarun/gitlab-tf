terraform {
  backend "s3" {
    bucket = "demosimplebucket-e03613d8ddcc0f3f"
    key    = "backend.tfstate"
    dynamodb_table = "LockTable"
    region = "eu-north-1"
    encrypt = true
  }
}