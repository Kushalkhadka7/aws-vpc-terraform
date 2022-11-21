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
