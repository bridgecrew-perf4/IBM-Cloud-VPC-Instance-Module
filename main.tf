resource "ibm_is_instance" "instance" {
  name           = "${var.name}-${var.zone}-instance"
  vpc            = var.vpc_id
  zone           = var.zone
  profile        = var.profile_name
  image          = data.ibm_is_image.image.id
  keys           = [data.ibm_is_ssh_key.key.id]
  resource_group = data.ibm_resource_group.group.id

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
