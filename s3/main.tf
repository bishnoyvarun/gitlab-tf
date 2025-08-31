provider "aws" {
  region  = "eu-north-1"
  profile = "vakky_devpos"
}

resource "aws_s3_bucket" "mysimplebucket" {
  bucket = "my-tf-bucket0001" 
   tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "bucket-data" {
  bucket = aws_s3_bucket.mysimplebucket.bucket
  key = "backend.tfstate"
}