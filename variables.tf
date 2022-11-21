

# Default aws region.
# -------------------------------------.
variable "aws_region" {
  default = "us-west-2"
  type    = string
}


# Variables reauired while creating VPC.
# -------------------------------------.

variable "vpc_cidr" {
  default = "192.168.0.0/16"
  type    = string
}

variable "vpc_name" {
  default = "default_vpc"
  type    = string
}

variable "enable_dns_hostnames" {
  default = true
  type    = bool
}

variable "enable_dns_support" {
  default = true
  type    = bool
}


# Variables reauired while creating public subnet.
# -----------------------------------------------.
variable "public_subnet_cidr" {
  default = ""
  type    = string
}

# Variables reauired while creating public subnet.
# -----------------------------------------------.
variable "private_subnet_cidr" {
  default = ""
  type    = string
}
