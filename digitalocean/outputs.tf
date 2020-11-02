# Infra Outputs
output "droplet_public_ip" {
  value = digitalocean_droplet.droplet_server.ipv4_address
}

output "droplet_resource_name" {
  value = digitalocean_droplet.droplet_server.urn
}