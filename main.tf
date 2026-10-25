resource "tls_private_key" "privateKey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "medicareRetirement" {
  key_name   = "xfusion-kp"
  public_key = tls_private_key.privateKey.public_key_openssh
  tags = {
    "Name" = "medicareretirement-keypair"
  }
}