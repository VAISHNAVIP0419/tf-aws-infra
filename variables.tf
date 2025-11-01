variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "name_prefix" {
  type    = string
  default = "tf-assessment"
}

variable "ssh_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "create_keypair" {
  type    = bool
  default = true
}

variable "existing_key_name" {
  type    = string
  default = ""
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.2.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["ap-south-1a"]
}

variable "create_bucket_name" {
  description = "If empty, module will create a bucket name using name_prefix and a random suffix"
  type = string
  default = ""
}

# EC2 AMI: optional override. If empty the ec2 module will lookup Amazon Linux 2 latest.
variable "ami_id" {
  type    = string
  default = ""
}

variable "common_tags" {
  type = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
    Owner       = "student"
  }
}