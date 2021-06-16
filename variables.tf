variable "subnet_id" {
  type = string
  description = "Subnet ID to use for primary network interfaces."
}

variable "name" {
  type = string
  description = "Name to attach to all resources."
}

variable "vpc_id" {
  type = string
  description = "ID of the VPC to use for the compoute instance."
}

variable "resource_group_id" {
  type = string
  description = "Resource Group ID to use for primary network interfaces."
}

variable "ssh_keys" {
  type = string
  description = "SSH Key ID that will be inserted in to the compute instance."
}
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
  type = bool
  description = "(Optional, bool) Indicates whether IP spoofing is allowed on this interface."
}

variable "force_recovery_time" {
  type = int 
  description = "Timeout (in minutes), to force the is_instance to recover from a perpetual `starting` state."
  default = 30
}
