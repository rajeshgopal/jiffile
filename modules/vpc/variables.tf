variable "name" {
  description = "Name of the environment"
  default     = "test"
}

variable "cidr" {
  description = "CIDR Range for VPC"
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "List of availability zones to use"
  default     = []
}

variable "subnet_size" {
  description = "Number of subnet bits size"
  default     = "4"
}

variable "private_subnets" {
  description = "Base CIDR private subnets to use"
  default     = "10.0.1.0/20"
}

variable "public_subnets" {
  description = "Base CIDR for public subnets to use"
  default     = "10.0.112.0/20"
}

variable "enable_dns" {
  description = "Whether to enable DNS services for this VPC"
  default     = true
}

variable "domain_name_servers" {
  description = "Custom DNS servers IPs"
  default     = "none"
}

