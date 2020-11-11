resource "ibm_is_instance" "instance" {
  name           = "${var.name}-${var.zone}-instance"
  vpc            = var.vpc_id
  zone           = var.subnet_id
  profile        = var.profile_name
  image          = data.ibm_is_image.image.id
  keys           = var.ssh_key_ids
  resource_group = var.resource_group_id

  # inject dns config
  user_data = file("${path.module}/instance-init.sh")

  primary_network_interface {
    subnet          = var.subnet_id
    security_groups = [var.security_group_id]
  }

  boot_volume {
    name = "${var.name}-${var.zone}-boot"
  }

  tags = concat(var.tags, ["instance"])
}