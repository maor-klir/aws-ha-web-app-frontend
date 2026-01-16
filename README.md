# aws-ha-web-app-frontend

A comprehensive Terraform implementation showcasing the provisioning of a highly available web application frontend on AWS.  
This project is heavily based on the excellent [Terraform 101](https://tekanaid.com/course/terraform-101) course by Sam Gabrail.  
I highly recommend it for any Terraform practitioner, whether you're beginning your journey or already experienced.  

My main focus working on this repository is infrastructure provisioning and design rather than the application stack.  
Building on Sam's project, I'm implementing key improvements focused on security hardening and adopting the latest best practices across infrastructure and operational domains.  

## Key Capabilities

This project demonstrates:

- Managing all infrastructure lifecycle declaratively through Terraform
- Utilizing HCP Terraform for remote state storage management and variable sets
- Publishing and consuming Terraform modules via HCP Terraform private registry (local module definitions are maintained in /terraform/modules for reference)
- Leveraging HCP Terraform OIDC integration for [dynamic provider credentials](https://developer.hashicorp.com/terraform/cloud-docs/dynamic-provider-credentials) with AWS
- Adhering to best practices regarding high availability and scalability

## Future Plans and Improvements

- [x] Dynamic provider credentials with AWS
- [x] Update to use the latest Ubuntu 24.04 LTS AMI available
- [ ] Enable IMDSv2 on EC2 instances
- [ ] Integrate Sentinel policies for infrastructure governance
