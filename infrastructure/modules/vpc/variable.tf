variable "created_by" {
  type        = string
  description = "Define created user name."
}

variable "vpc_cidr" {
  type        = string
  description = "Define VPC CIDR range."
}

variable "vpc_name" {
  type        = string
  description = "Define VPC name."
}


variable "public_subnet_cidr" {
  type        = list(string)
  description = "Define public subnet CIDR range"
}


variable "private_subnet_cidr" {
  type        = list(string)
  description = "Define private subnet CIDR range"
}


variable "availability_zones" {
  type        = list(string)
  description = "Define mutiple availability zone"
}
