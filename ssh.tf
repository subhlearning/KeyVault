resource tls_private_key main {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource azurerm_key_vault_secret ssh_public_key {
  name         = "ssh-public"
  value        = tls_private_key.main.public_key_openssh
  key_vault_id = azurerm_key_vault.main.id
}

resource azurerm_key_vault_secret ssh_private_key {
  name         = "ssh-private"
  value        = tls_private_key.main.private_key_pem
  key_vault_id = azurerm_key_vault.main.id
}