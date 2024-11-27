# Generates a secure private k ey and encodes it as PEM
resource "tls_private_key" "ec2-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
# Create the Key Pair
resource "aws_key_pair" "ec2-key" {
  key_name   = "swebserverkey"
  public_key = tls_private_key.ec2-key.public_key_openssh
}
# Save file
resource "local_file" "ssh_key" {
  filename        = "web_server_key.pem"
  content         = tls_private_key.ec2-key.private_key_pem
  file_permission = "400"
}
locals {
  service_name = "forum"
  owner        = "Community Team"
}
