# Highly Available Infrastructure on AWS

A comprehensive Terraform implementation showcasing the provisioning of a highly available web application frontend on AWS.  
This project is heavily based on the excellent [Terraform 101](https://tekanaid.com/course/terraform-101) course by Sam Gabrail.  
I highly recommend it for any Terraform practitioner, whether you are just beginning your journey or already a seasoned Terraformer.  

My main focus working on this repository is infrastructure provisioning and architectural design rather than the application stack.  
The nginx web server with basic HTML content serves as a proof-of-concept to verify and demonstrate that the infrastructure is operational and traffic is being distributed correctly across availability zones.  

Building on Sam's project, I am focusing on strengthening security controls, implementing infrastructure best practices, and optimizing operational workflows.

## Architecture Highlights

This implementation showcases:

### Infrastructure as Code

- Managing all infrastructure lifecycle declaratively through Terraform
- Utilizing HCP Terraform for remote state storage management and variable sets
- Publishing and consuming Terraform modules via HCP Terraform private registry (local module definitions are maintained in /terraform/modules for reference)

### Security and Operations

- Leveraging HCP Terraform OIDC integration for [dynamic provider credentials](https://developer.hashicorp.com/terraform/cloud-docs/dynamic-provider-credentials) with AWS (implementation can be seen [on this repository](https://github.com/maor-klir/hcpt-dynamic-provider-credentials))

### High Availability and Scalability

- Multi availability zones deployment for high availability and fault tolerance
- Auto Scaling Group with ELB health checks for self-healing infrastructure
- Application Load Balancer with target group health monitoring distributing traffic across availability zones

## Future Plans and Improvements

- [x] Dynamic provider credentials with AWS
- [x] Update to use the latest Ubuntu 24.04 LTS AMI available
- [ ] Enable IMDSv2 on EC2 instances
- [ ] Integrate Sentinel policies for infrastructure governance
