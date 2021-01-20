resource "ibm_is_instance" "instance" {
  name           = var.name
  vpc            = var.vpc_id
  zone           = var.zone
  profile        = var.profile_name
  image          = data.ibm_is_image.image.id
  keys           = [var.ssh_keys]
  resource_group = data.ibm_resource_group.group.id

  user_data = var.user_data

  primary_network_interface {
    subnet          = var.subnet_id
    security_groups = [var.security_group_id]
  }

  boot_volume {
    name = "${var.name}-boot-volume"
  }

  tags = concat(var.tags, ["instance", "zone:${var.zone}"])
}
