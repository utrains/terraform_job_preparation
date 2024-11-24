output "ssh_to_web_server" {
  value = join("", ["ssh -i web_server_key.pem ec2-user@", aws_instance.web-server.public_dns])
}

output "Connexion_link_for_the_web_server" {
  value = join("", ["http://",aws_instance.web-server.public_dns, ":", "80"])
}