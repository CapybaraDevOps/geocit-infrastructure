# Geocitizen Infrastructure
**This repository contains necessary files for Geocitizen application deployment on Google Cloud Platform**
## Summary
- jenkins
- terraform
- ansible
- awx

### Jenkins
This folder contains Jenkinsfile for each pipeline used in this project. You can chose which environment(dev, stage, prod) you want to cteate.
### Terraform
This folder contains terraform files for creating the infrastructure. Creating tree geocit environments(dev, stage, prod) using terragrunt
**Warning: you must be logged in your Google account or add "terraform_creds" service account in your Jenkins.**
### Ansible
This folder contains all necessary playbooks for application dependencies installation, monitoring and deployment for **Ubuntu 22.04**.
You can find more details about Ansible playbooks in this folder.
### AWX
This folder contains all necessary playbooks for application dependencies installation, monitoring and deployment for **Ubuntu 22.04** using AWX.
