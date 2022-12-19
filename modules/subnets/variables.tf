clearvariable "vpc_cidr_block" {
  type        = string
  description = "Current VPC CIDR ranage"
}

# -----------------------------------------------.
# Variables reauired while creating public subnet.
# -----------------------------------------------.
variable "public_subnet_cidr" {
  default     = ""
  type        = string
  description = "Public subnet cidr range"
}

variable "vpc_id" {
  type        = string
  description = "Current vpc id"
}


variable "internet_gw_id" {
  default     = ""
  type        = string
  description = "Internet gateway id"
}

variable "public_subnet_count" {
  type    = number
  default = 0
  # [NOTE]: Number should be less than the number of AZ in the aws region.
  description = "No of public subnets to be create."
}


# ------------------------------------------------.
# Variables reauired while creating private subnet.
# ------------------------------------------------.
variable "private_subnet_cidr" {
  default     = ""
  type        = string
  description = "Private subnet cidr range"
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

variable "cluster_name" {
  type        = string
  defualt     = "test"
  description = "Name of the eks cluster if we want to create any"
}
