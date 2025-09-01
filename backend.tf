terraform {
  backend "s3" {
    bucket = module.s3.mybucket
    key    = module.s3.key
    dynamodb_table       = module.db.dbtable
    region = "eu-north-1"
    encrypt = true
  }
}