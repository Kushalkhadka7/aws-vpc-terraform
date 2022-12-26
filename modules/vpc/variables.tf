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

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags that will be attached to the underlying resources created."
}

variable "additional_tags" {
  type        = map(string)
  default     = {}
  description = "Addiiotnal Tags that will be attached to the underlying resources created."
}

variable "enable_network_address_usage_metrics" {
  type        = bool
  default     = false
  description = "Whether Network Address Usage metrics are enabled for the VPC"
}

variable "assign_generated_ipv6_cidr_block" {
  type        = bool
  default     = false
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC"
}

variable "instance_tenancy" {
  type        = string
  default     = "default"
  description = "A tenancy option for instances launched into the VPC, available options `default`, `dedicated`"
  # [NOTE]: This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee.
}
