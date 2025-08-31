variable "dbtable" {
  #default = module.db.dbtable
}

variable "bucket_name" {
  #default = module.s3.mybucket
}                
variable "key_name" {
    #default = module.s3.key  
  
}
variable "sg_var" {
  #default = module.vpc.sg
}
variable "vpc_var" {
  #default = module.vpc.myvpc
}
variable "subnet1_id" {
  #default = module.vpc.pb_sn1
}

variable "subnet2_id" {
  #default = module.vpc.pb_sn2
}
variable "subnet3_id" {
  #default = module.vpc.pb_sn3
}                 
                         