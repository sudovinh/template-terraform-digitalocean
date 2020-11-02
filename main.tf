# Main TF
provider "digitalocean" {
  token = var.digitalocean_token
}

# Save Terraform State to Space 
# https://dev.to/aleixmorgadas/storing-terraform-state-in-digital-ocean-space-3a97
terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "sfo2.digitaloceanspaces.com"
    region                      = "us-east-1"
    bucket                      = "your-digitalocean-space"
    key                         = "dev-infrastructure/terraform.tfstate"
  }
}

# Setup Infrastructure in Digital Ocean
module "digitalocean" {
  source                     = "./digitalocean"
  region                     = var.digitalocean_region
  droplet_prefix             = var.droplet_prefix
  droplet_base_image         = var.droplet_base_image
  droplet_size               = var.droplet_size
  droplet_monitoring         = var.droplet_monitoring
  droplet_backups            = var.droplet_backups
  droplet_private_networking = var.droplet_private_networking
  droplet_ipv6               = var.droplet_ipv6
  droplet_firewall_allow_ips = var.droplet_firewall_allow_ips
  ssh_keys                   = var.ssh_keys
  ssh_agent                  = var.ssh_agent
  ssh_private_key            = var.ssh_private_key
  tags                       = var.tags
}

# Organize resource into Digital Ocean Project Folder
data "digitalocean_project" "resource_folder_1" {
  name = "dev_infra"
}

resource "digitalocean_project_resources" "resource_folder_1_resources" {
  project = data.digitalocean_project.resource_folder_1.id
  resources = [
    module.digitalocean.droplet_resource_name
  ]
}
