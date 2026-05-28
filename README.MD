**Azure Infrastructure Deployment using Terraform**



&#x20;**Project Overview** 

This project demonstrates Infrastructure as Code (IaC) deployment on Microsoft Azure using Terraform. The infrastructure includes:

&#x09;o Resource Group

&#x09;o Virtual Network

&#x09;o Subnet

&#x09;o Public IP

&#x09;o Network Security Group (NSG)

&#x09;o Network Interface Card (NIC)

&#x09;o Linux Virtual Machine

The project also includes SSH-based remote access configuration for Linux VM administration.



**Technologies Used**

&#x09;o Microsoft Azure

&#x09;o Terraform

&#x09;o Linux (Ubuntu 22.04)

&#x09;o Git

&#x09;o GitHub



&#x20;Infrastructure Components

&#x09;1. Resource Group: Created Azure Resource Group named `santech`.

&#x09;2. Virtual Network: Configured Virtual Network and subnet for VM connectivity.

&#x09;3. Network Security Group (NSG): Configured inbound security rules for:

&#x09;	o SSH (Port 22)

&#x09;	o HTTP (Port 80)

&#x09;	o HTTPS (Port 443)

&#x09;4. Public IP: Configured static public IP for remote VM access.

&#x09;5. Linux Virtual Machine: Provisioned Ubuntu Linux VM using Terraform.

&#x09;6. Terraform Workflow

&#x09;	o terraform init

&#x09;	o terraform validate

&#x09;	o terraform plan

&#x09;	o terraform apply



&#x09;7. SSH Access:  ssh azureuser@<public-ip>

&#x09;8.Project Structure



&#x09;		azure-devops-project/

&#x09;		│

&#x09;		├── terraform/					

&#x09;		├── screenshots/

&#x09;		├── README.md

&#x09;		└── .gitignore



&#x09;9. Learning Outcomes



&#x09;	o Infrastructure as Code (IaC)

&#x09;	o Azure Networking

&#x09;	o Terraform Resource Management

&#x09;	o Linux VM Provisioning

&#x09;	o NSG and Public IP Configuration

&#x09;	o SSH Connectivity Troubleshooting



