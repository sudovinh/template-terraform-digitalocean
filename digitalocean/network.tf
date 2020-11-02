# Setup VPC, Firewall(SG) and Load balancer

resource "digitalocean_firewall" "droplet_firewall" {
  name = format("%s-%s-firewall", var.droplet_prefix, var.region)

  droplet_ids = [digitalocean_droplet.droplet_server.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = var.droplet_firewall_allow_ips
  }
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
