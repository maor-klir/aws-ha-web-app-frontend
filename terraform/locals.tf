locals {
  name_suffix = "${var.project_name}-${var.environment_name}"

  required_tags = {
    name        = local.name_suffix
    project     = var.project_name
    environment = var.environment_name
  }

  tags = merge(var.resource_tags, local.required_tags)

  user_data = var.display_version ? templatefile("${path.module}/user-data/install_libraries.sh.tftpl", {
    version = var.app_version
  }) : file("${path.module}/user-data/install_libraries.sh")

  inbound_ports = [var.ssh_port, var.http_port, var.https_port]
}
