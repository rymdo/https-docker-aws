variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.1.0.0/24"
}

variable "availability_zone" {
  description = "availability zone to create subnet"
  type        = string
}
