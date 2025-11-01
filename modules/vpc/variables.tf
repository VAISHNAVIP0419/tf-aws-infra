variable "name_prefix" {}
variable "cidr" {}
variable "azs" {
  type = list(string)
  default = ["ap-south-1a"]
}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "tags" {
  type = map(string)
  default = {}
}
