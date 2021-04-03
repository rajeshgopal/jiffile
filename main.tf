provider "aws" {
  region  = "us-east-1"
  profile = "test" # create this profile in your aws cli config
}

module "vpc" {
  source          = "./modules/vpc"
  name            = "test1"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = "10.0.1.0/20"
  public_subnets  = "10.0.112.0/20"

}

module "ecs" {
  source = "./modules/ecs"
  vpc_id = module.vpc.vpc_id
  name   = "test1"

}