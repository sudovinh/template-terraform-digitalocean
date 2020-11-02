# Main variables

# Digital Ocean Backend
variable "region" {
  description = "The region to deploy resources to"
}

# SSH
variable "ssh_private_key" {
  description = "The file path to the private SSH key. "
}

variable "ssh_keys" {
  description = "A list of SSH IDs or fingerprints to enable for the Droplets"
}

variable "ssh_agent" {
  description = "Whether or not to use the SSH agent to authenticate"
}

# Droplet 
variable "droplet_prefix" {
  description = "The name prefix to append to resources"
}

variable "droplet_base_image" {
  description = "The unique slug that identifies the Droplet image"
}

variable "droplet_size" {
  description = "The unique slug that identifies the Droplet size"
}

variable "droplet_monitoring" {
  description = "Whether or not to install the monitoring agent"
}

variable "droplet_backups" {
  description = "Whether or not to enable backups"
}

variable "droplet_private_networking" {
  description = "Whether or not to enable private networking"
}

variable "droplet_ipv6" {
  description = "Whether or not to enable IPv6 networking"
}

variable "droplet_firewall_allow_ips" {
  description = "A list of ips that can ssh into droplet"
}

variable "tags" {
  description = "A list of the existing tag resources to label the Droplets"
}
