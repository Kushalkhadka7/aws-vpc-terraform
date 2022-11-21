# Variables reauired while creating public subnet.
# -----------------------------------------------.
variable "public_subnet_cidr" {
  default     = ""
  type        = string
  description = "Public subnet cidr range"
}

variable "vpc_id" {
  default     = ""
  type        = string
  description = "Current vpc id"
}

variable "availability_zones" {
  default     = []
  type        = list(string)
  description = "List of availability zones in a region"
}


variable "internet_gw_id" {
  default     = ""
  type        = string
  description = "Internet gateway id"
}


# Variables reauired while creating private subnet.
# -----------------------------------------------.
variable "private_subnet_cidr" {
  default     = ""
  type        = string
  description = "Private subnet cidr range"
}


