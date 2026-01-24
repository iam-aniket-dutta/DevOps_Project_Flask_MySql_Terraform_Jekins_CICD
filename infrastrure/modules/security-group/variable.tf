variable "created_by" {
  type        = string
  description = "Define created user name."
}

variable "vpc_id" {
  type        = string
  description = "Define vpc id"
}

variable "public_subnet_cidr" {
  type        = list(string)
  description = "Define public subnet CIDR block"
}
