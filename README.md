# template-terraform-digitalocean
Template for creating terraform repos in Digital Ocean.

```bash
├── README.md
├── config.tf # Variables for all modules
├── digitalocean # Main Infrastructure Module
│   ├── droplet.tf # Setup Droplet Server
│   ├── network.tf # Setup VPC + other network services
│   └── outputs.tf # Main Infrastructure Outputs
├── dns # DNS Module
│   ├── dns.tf # Setup DNS
│   └── outputs.tf # DNS outputs
└── terraform.tf # Main Terraform File
```