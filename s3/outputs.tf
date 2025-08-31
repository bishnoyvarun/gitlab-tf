output "mybucket" {
  value = aws_s3_bucket.mysimplebucket.bucket
  
}

output "key" {
  value = aws_s3_object.bucket-data.key
  
}