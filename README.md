# Main repo to create infrastructure on AWS

This repo has modules defined for VPC and ECS cluster

VPC module creates a VPC, subnets and routetables on 3 AZs
ECS module creates ECS cluster for FARGATE, Application Loadbalancer, and Security groups

1. Install terraform (latest version) on your local
2. Install AWS CLI and create profile on your local
3. Open main.tf - update aws region, profile name in aws provider block
4. Modules are defined with test defaults, with that it can create a VPC and subnets
5. Run terraform init and plan - It will list out what all resources its going to create.
6. Review the plan output and once you are OK, run terraform apply.