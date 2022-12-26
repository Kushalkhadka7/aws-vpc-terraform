# ------------------.
# Default aws region.
# ------------------.
variable "aws_region" {
  default     = "us-west-2"
  type        = string
  description = "Default aws region"
}

# -----------------.
# Variables for VPC.
# -----------------.
variable "vpc_cidr" {
  type        = string
  default     = "192.168.0.0/16"
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

variable "additional_tags" {
  type        = string
  default     = "default"
  description = "Additional tags"
}

variable "instance_tenancy" {
  type        = string
  default     = "default"
  description = "A tenancy option for instances launched into the VPC, available options `default`, `dedicated`"
  # [NOTE]: This has a dedicated per region fee of $2 per hour, plus an hourly per instance usage fee.
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


# -----------------------------------------------.
# Variables reauired while creating public subnet.
# -----------------------------------------------.
variable "public_subnet_cidr" {
  type    = string
  default = ""
  # [NOTE]: CIDR range should be within the range of VPC CIDR
  description = "CIDR range for public subnets"
}

variable "public_subnet_count" {
  type    = number
  default = 0
  # [NOTE]: Number should be less than the number of AZ in the aws region.
  description = "No of public subnets to be create."
}

# -----------------------------------------------.
# Variables reauired while creating public subnet.
# -----------------------------------------------.
variable "private_subnet_cidr" {
  default     = ""
  type        = string
  description = "CIDR range for private subnets"
}

variable "private_subnet_count" {
  type    = number
  default = 0
  # [NOTE]: Number should be less than the number of AZ in the aws region.
  description = "No of private subnets to be create."
}


# --------------------.
# NAT Gateway varibales.
# --------------------.
variable "create_nat_gateway" {
  type        = bool
  default     = true
  description = "Flag to determint to create nat gateway"
}

variable "no_of_nat_gateway" {
  type        = number
  default     = 1
  description = "Total no of nat gateways that we want to run in the vpc"
}

# This needs to be provided if we want to create EKS cluster in this vpc.
variable "cluster_name" {
  type        = string
  default     = "test"
  description = "Name of the eks cluster if we want to create any"
}
