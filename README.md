# aws-ha-web-app-frontend

A simple demo showcasing the provisioning of a highly available web application frontend on AWS.  
This implementation is heavely based on the project built throughout Sam Gabrail's excellent [Terraform 101](https://tekanaid.com/course/terraform-101) comprehensive course.  
I highly recommended it for any Terraform practitioner, whether you are only beginning your journey with Terraform or already a seasoned Terraformer.  

My main focus creating this repository is not the application stack but rather concentrating on the infrastructure landscape.  
Building on Sam's project, I'm planning to bring a few key improvements into the project focused on security hardening and adpoting the latest best practices across all possible domains.  

## Main Concerns and Key Features

- Managing all infrastructure lifecycle declaratively through Terraform
- Utilizing HCP Terraform for remote state storage management and variable sets
- Publishing and consuming Terraform modules on HCP Terraform private registry
- Using HCP Terraform’s native OIDC integration with AWS to get dynamic credentials for the AWS provider in HCP Terraform runs
- Adhering as much as possible to best practices regarding high availabilty, scalability

## Future Plans and Improvements

- [ ] Dymanic provider credentials with AWS
- [x] Update to use the latest Ubuntu 24.04 LTS AMI available.
- [ ] Enable IMDSv2 - EC2 instances
- [ ] Integrating Sentinel policies
