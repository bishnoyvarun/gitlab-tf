terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.11.0"
    }
  }
}


#root
module "vpc" {
  source = "./vpc"
  
}

module "s3" {
  source = "./s3"
  
}

module "db" {
  source = "./db"
  
} 
module "eks" {
  source = "./eks"

  vpc_var       = module.vpc.myvpc
  subnet1_id  = module.vpc.pb_sn1
  subnet2_id  = module.vpc.pb_sn2
  subnet3_id  = module.vpc.pb_sn3
  sg_var        = module.vpc.sg
  bucket_name   = module.s3.mybucket
  key_name      = module.s3.key
  dbtable       = module.db.dbtable
}

