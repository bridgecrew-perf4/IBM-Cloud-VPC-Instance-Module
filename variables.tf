variable "subnet_id" {}
variable "name" {}
variable "vpc_id" {}
variable "resource_group" {}

variable "ssh_keys" {}
variable "image_name" {
  default = "ibm-ubuntu-20-04-minimal-amd64-2"
}
variable "profile_name" {
  default = "cx2-2x4"
}
variable "tags" {}
variable "security_groups" {}
variable "zone" {}
variable "user_data" {}
variable "allow_ip_spoofing" {
  type        = bool
  description = "(Optional, bool) Indicates whether IP spoofing is allowed on this interface."
}
