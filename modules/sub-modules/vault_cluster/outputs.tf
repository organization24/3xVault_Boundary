output "vault-instance-public-ips" {
  value = aws_instance.vault
}

output "ssh_private_key" {
  value = tls_private_key.vault-ssh-key.private_key_pem
}