variable "pem_file_path" {
  type        = string
  default     = "./medicare_Retirement.pem"
  description = "PAth to the pem file used for ec2 login"
}

variable "file_permission" {
  type        = string
  default     = "0600"
  description = "Add read and write permission to the file for the existing user"
}

variable "cidr_block" {
  type        = string
  default     = "192.168.0.0/24"
  description = "ip address range for the vpc"
}

variable "cidr_anywhere" {
  type        = string
  default     = "0.0.0.0/0"
  description = "ip address to allow anywhere"
}

variable "tcp_protocol" {
  type        = string
  default     = "tcp"
  description = "tcp protocol to enable connection between cllient and the server"
}

variable "subnet_ips" {
  type        = list(string)
  default     = ["192.168.0.0/28"]
  description = "to create subnets with ip addresses"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "type of the instance"
}

variable "ec2_ami" {
  type        = string
  default     = "ami-0c101f26f147fa7fd"
  description = "ami instance"
}

variable "type_of_ebs_volume" {
  type        = string
  default     = "gp3"
  description = "type fo ebs volume"
}