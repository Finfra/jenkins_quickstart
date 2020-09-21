output "Jenkins-ip" {
  value = aws_instance.Jenkins.public_ip
}
output "jm1-ip" {
  value = aws_instance.jm1.public_ip
}
output "jm2-ip" {
  value = aws_instance.jm2.public_ip
}
