resource "ibm_is_instance" "instance" {
  name           = var.name
  vpc            = var.vpc_id
  zone           = var.zone
  profile        = var.profile_name
  image          = data.ibm_is_image.image.id
  keys           = var.ssh_keys
  resource_group = var.resource_group
  allow_ip_spoofing = != "" ? var.allow_ip_spoofing : false

  user_data = var.user_data != "" ? var.user_data : file("${path.module}/init.yml")
  

  primary_network_interface {
    subnet          = var.subnet_id
    security_groups = [var.security_groups != null ? var.security_groups : null]
  }

  boot_volume {
    name = "${var.name}-boot-volume"
  }

  tags = var.tags
}
