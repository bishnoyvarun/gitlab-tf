output "myvpc" {
  value = aws_vpc.myvpc.id
  
}

output "pb_sn1" {
  value = aws_subnet.sn1.id
  
}
output "pb_sn2" {
  value = aws_subnet.sn2.id
  
}
output "pb_sn3" {
  value = aws_subnet.sn3.id
  
}

output "sg" {
  value = aws_security_group.sg.id
  
}

