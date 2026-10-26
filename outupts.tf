output "ssh_command" {
  value = "ssh -i ${var.pem_file_path} ec2_user@${aws_instance.medicare_retirement_ec2.public_ip}"
}

