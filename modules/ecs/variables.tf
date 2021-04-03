
variable "vpc_id" {
  description = "VPC ID"

}
variable "alb_idle_timeout" {
  description = "timeout for alb"
  default     = 180
}

variable "name" {
  description = "Service Stack Name"
  default     = "test"
}

variable "enable_deletion_protection" {
  description = "(Optional) If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer. Defaults to false."
  type        = bool
  default     = false
}

variable "enable_cross_zone_load_balancing" {
  description = "(Optional) If true, cross-zone load balancing of the load balancer will be enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "enable_http2" {
  description = "(Optional) Indicates whether HTTP/2 is enabled in the load balancer. Defaults to true."
  type        = bool
  default     = false
}

variable "alb_subnet" {
  description = "Subnet tag name for alb subnets"
  default     = "-web-"
}
