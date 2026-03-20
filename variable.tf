variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC CIDR Block"
  type        = string

}

variable "az-01" {
  default     = "ap-south-1a"
  description = "Availability Zone 01"
  type        = string
}
variable "az-02" {
  default     = "ap-south-1b"
  description = "Availability Zone 02"
  type        = string
}

variable "publicsubnet1_cidr" {
  default     = "10.0.0.0/24"
  description = "Public Subnet CIDR Block"
  type        = string

}

variable "publicsubnet2_cidr" {
  default     = "10.0.1.0/24"
  description = "Public Subnet CIDR Block"
  type        = string

}

variable "privatesubnet1_cidr" {
  default     = "10.0.2.0/24"
  description = "Private Subnet CIDR Block"
  type        = string

}
variable "privatesubnet2_cidr" {
  default     = "10.0.3.0/24"
  description = "Private Subnet CIDR Block"
  type        = string

}
variable "privatesubnet3_cidr" {
  default     = "10.0.4.0/24"
  description = "Private Subnet CIDR Block"
  type        = string

}
variable "privatesubnet4_cidr" {
  default     = "10.0.5.0/24"
  description = "Private Subnet CIDR Block"
  type        = string

}
