resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "medicare_Retirement" {
  key_name   = "xfusion-kp"
  public_key = tls_private_key.private_key.public_key_openssh
  tags = {
    "Name" = "medicareretirement-keypair"
  }
  depends_on = [tls_private_key.private_key]
}

resource "local_file" "local_privete_key" {
  content         = tls_private_key.private_key.private_key_pem
  filename        = "./medicare_Retirement.pem"
  file_permission = "0600"
  depends_on      = [tls_private_key.private_key, aws_key_pair.medicare_Retirement]
}