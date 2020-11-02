# Setup Droplet
resource "digitalocean_droplet" "droplet_server" {
  name   = format("%s-%s", var.droplet_prefix, var.region)
  image  = var.droplet_base_image
  size   = var.droplet_size
  region = var.region
  tags   = var.tags

  monitoring         = var.droplet_monitoring
  backups            = var.droplet_backups
  private_networking = var.droplet_private_networking
  ipv6               = var.droplet_ipv6

  user_data = data.template_file.cloud_config.rendered
  ssh_keys  = var.ssh_keys

  connection {
    host        = self.ipv4_address
    type        = "ssh"
    agent       = var.ssh_agent
    user        = "root"
    private_key = file(var.ssh_private_key)
    timeout     = "2m"
  }

  # Outputs cloud-init and waits for the boot to finish before allowing the
  # resource to be considered created. This asserts SSH connectivity can be
  # established and cloud-init is reporting as expected, tainting on failure.
  provisioner "remote-exec" {
    inline = [
      "test -f /var/log/cloud-init-output.log",
      "tail -f /var/log/cloud-init-output.log &",
      "until [ -f /var/lib/cloud/instance/boot-finished ]; do sleep 1; done",
    ]
  }
}
