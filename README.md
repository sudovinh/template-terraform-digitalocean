# template-terraform-digitalocean
Template for creating terraform repos that are in Digital Ocean.

```bash
├── README.md # what you are reading
├── digitalocean # Digital Ocean Module
│   ├── droplet.tf # where droplets are created
│   ├── network.tf # where firewall, vpc, and other network are created
│   ├── outputs.tf # output certain variables
│   ├── templates # where terraform templates are stored.
│   │   └── tmpl_cloud_config.yml # cloud init template
│   └── variables.tf # variables for all resource in this module. usually not set and passed from main.tf
├── main.tf # main terraform file
├── terraform.tfvars.example # example of secrets variables. Must copy and rename to terraform.tfvars
├── variables.tf # main variables for all modules
└── versions.tf # current version of terraform
```

## Pre-Requisites
1. Follow the steps to get things configured: https://dev.to/aleixmorgadas/storing-terraform-state-in-digital-ocean-space-3a97 if you want to use Digital Ocean Space as your backend for Terraform states.
2. Make copy of terraform.tfvars.example and rename to terraform.tfvars. (This is git ignored)
3. Make changes to the main variable file (template-terraform-digitalocean/variables.tf) Please see Inputs below.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0, < 0.14.0 |
| digitalocean | >= 1.22 |
| template | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| digitalocean | >= 1.22 |
| template | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access_key | For using Digital Ocean Space as your backend. backend_config.hcl | `string` | `null` | no |
| secret_key | For using Digital Ocean Space as your backend. backend_config.hcl | `string` | `null` | no |
| digitalocean_token | Your Digital Ocean API token. terraform.tfvars | `string` | `null` | yes |
| ssh_private_key | Path to your private ssh key. Used to connect with provisioner. terraform.tfvars | `string` | `null` | yes |
| nonroot_user_password | For when creating non-root user in cloud init. terraform.tfvars | `string` | `null` | yes |
| digitalocean_region | Region in Digital Ocean. variables.tf | `string` | `sfo2` | yes |
| ssh_keys | A list of ssh key fingerprints. variables.tf | `list` | `null` | yes |
| ssh_agent | Whether or not to use the SSH agent to authenticate. variables.tf | `bool` | `false` | yes |
| droplet_prefix | The name prefix to append to resources. variables.tf | `string` | `droplet` | yes |
| droplet_base_image | The unique slug that identifies the Droplet image. variables.tf | `string` | `ubuntu-18-04-x64` | yes |
| droplet_size | Droplet Type/Size. variables.tf | `string` | `s-2vcpu-2gb` | yes |
| droplet_monitoring | Whether or not to install the monitoring agent. variables.tf | `bool` | `true` | yes |
| droplet_backups | Whether or not to enable backups. variables.tf | `bool` | `true` | yes |
| droplet_private_networking | Whether or not to enable private networking. variables.tf | `bool` | `false` | yes |
| droplet_ipv6 | whether or not to enable IPv6 networking. variables.tf | `bool` | `false` | yes |
| droplet_firewall_allow_ips | A list of ips that can ssh into droplet. variables.tf | `list(string)` | `null` | yes |
| tags | A list of the existing tag resources to label the Droplets. variables.tf | `list(string)` | `["project:droplettest", "env:dev"]` | yes |

## Outputs

| Name | Description |
|------|-------------|
| droplet_public_ip | Droplet Public IP |
| droplet_resource_name | Droplet Resource Name |

## How to initialize terraform state in Digital Ocean Space
You can either us AWS S3 or Digital Ocean Space to store your Terraform State file. For this repo, we will use Digital Ocean Space

1. Follow the steps to get things configured: https://dev.to/aleixmorgadas/storing-terraform-state-in-digital-ocean-space-3a97
2. Make copy of backend_config.hcl.example and rename to backend_config.hcl (If you not have not done it from step 1. Also git ignored)
3. Make sure to do pre-reqs
4. Run `terraform init --backend-config=./backend_config.hcl`
