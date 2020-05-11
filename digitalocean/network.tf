# Setup VPC, Firewall(SG) and Load balancer

# resource "digitalocean_vpc" "example" {
#   name     = "example-project-network"
#   region   = "nyc3"
#   ip_range = "10.10.10.0/24"
# }

# resource "digitalocean_firewall" "web" {
#   name = "only-22-80-and-443"

#   droplet_ids = [digitalocean_droplet.web.id]

#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "22"
#     source_addresses = ["192.168.1.0/24", "2002:1:2::/48"]
#   }

#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "80"
#     source_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   inbound_rule {
#     protocol         = "tcp"
#     port_range       = "443"
#     source_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   inbound_rule {
#     protocol         = "icmp"
#     source_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   outbound_rule {
#     protocol              = "tcp"
#     port_range            = "53"
#     destination_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   outbound_rule {
#     protocol              = "udp"
#     port_range            = "53"
#     destination_addresses = ["0.0.0.0/0", "::/0"]
#   }

#   outbound_rule {
#     protocol              = "icmp"
#     destination_addresses = ["0.0.0.0/0", "::/0"]
#   }
# }

# resource "digitalocean_loadbalancer" "public" {
#   name   = "loadbalancer-1"
#   region = "nyc3"

#   forwarding_rule {
#     entry_port     = 80
#     entry_protocol = "http"

#     target_port     = 80
#     target_protocol = "http"
#   }

#   healthcheck {
#     port     = 22
#     protocol = "tcp"
#   }

#   droplet_ids = [digitalocean_droplet.web.id]
# }