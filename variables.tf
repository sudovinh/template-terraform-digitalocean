# Main variables

# Digital Ocean Backend
variable "digitalocean_token" {
  description = "Digitalocean Token"
  type        = string
}
variable "digitalocean_region" {
  description = "The region to deploy resources to"
  type        = string
  default     = "sfo2"
}

# SSH
variable "ssh_private_key" {
  description = "The file path to the private SSH key. "
  type        = string
}

variable "ssh_keys" {
  description = "A list of SSH IDs or fingerprints to enable for the Droplets"
  type        = list(string)
  default     = ["SSH KEY FINGER PRINT HERE"]
}

variable "ssh_agent" {
  description = "Whether or not to use the SSH agent to authenticate"
  type        = bool
  default     = false
}

# Droplet
variable "droplet_prefix" {
  description = "The name prefix to append to resources"
  type        = string
  default     = "droplet"
}

variable "droplet_base_image" {
  description = "The unique slug that identifies the Droplet image"
  default     = "ubuntu-18-04-x64"
}

variable "droplet_size" {
  description = "Droplet Type/Size"
  default     = "s-2vcpu-2gb"
}

variable "droplet_monitoring" {
  description = "Whether or not to install the monitoring agent"
  default     = true
}

variable "droplet_backups" {
  description = "Whether or not to enable backups"
  default     = true
}

variable "droplet_private_networking" {
  description = "Whether or not to enable private networking"
  default     = false
}

variable "droplet_ipv6" {
  description = "Whether or not to enable IPv6 networking"
  default     = false
}

variable "droplet_firewall_allow_ips" {
  description = "A list of ips that can ssh into droplet"
  type        = list(string)
  default     = ["{IP OF YOUR HOME IP}"]
}

variable "tags" {
  description = "A list of the existing tag resources to label the Droplets"
  type        = list(string)
  default     = ["project:droplettest", "env:dev"]
}
