# aws-ha-web-app-frontend

A simple demo showcasing the provisioning of a highly available web application frontend on AWS.  
The main focus is not the application stack but rather:  

- Managing all infrastructure lifecycle declaratively through Terraform
- Utilizing HCP Terraform for remote state storage management and variable sets
- Publishing and consuming Terraform modules on HCP Terraform private registry
- Using HCP Terraform’s native OIDC integration with AWS to get dynamic credentials for the AWS provider in HCP Terraform runs
- Adhering as much as possible to best practices regarding high availabilty, scalability

## Future Improvements

- [ ] Dymanic provider credentials with AWS
- [x] Update to use the latest Ubuntu 24.04 LTS AMI available
- [ ] Enable IMDSv2 - EC2 instances
- [ ] Integrating Sentinel policies
