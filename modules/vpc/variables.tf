variable "vpc_cidr" {
  type        = string
  description = "CIDR range for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "Vpc name"
}

variable "enable_dns_hostnames" {
  type        = bool
  default     = true
  description = "Flag to enable DNS hostnames in the VPC"
}

variable "enable_dns_support" {
  type        = bool
  default     = true
  description = "Flag to enable DNS hostnames support in the VPC"
}

variable "enable_classiclink" {
  type        = bool
  default     = false
  description = "Flag to enable classisLink for the VPC"
}

variable "enable_classiclink_dns_support" {
  type        = bool
  default     = false
  description = "Flag to enable classisLink support for the VPC"
}
