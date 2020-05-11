# Main TF

# Save Terraform State to Space 
# https://dev.to/aleixmorgadas/storing-terraform-state-in-digital-ocean-space-3a97

terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "https://fra1.digitaloceanspaces.com"
    region                      = "us-east-1" // needed
    bucket                      = "<THE NAME OF YOUR SPACE>" // name of your space
    key                         = "infrastructure/terraform.tfstate"
  }
}

# Setup DNS
module "dns" {
  source = "./dns"
  config = var.dns
  # This line over here makes the aws outputs available on cloudflare module.
  outputs = {
    server_public_ip = module.aws.server_public_ip
  }
}

# Setup Infrastructure in AWS
module "digitalocean" {
  source = "./digitalocean"
  config = var.infra
  outputs = { }
}
# This makes the output variable from outside the module.
output "server_public_ip" {
  value = module.aws.server_public_ip
}