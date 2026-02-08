variable "region" {
  type        = string
  description = "Define your specific region"
}

variable "created_by" {
  type        = string
  description = "Define created user name."
}

variable "bucket_name" {
  type        = string
  description = "Define bucket name for storing remote state file"
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

variable "instance_name" {
  type        = string
  description = "Define instance name"
}

variable "ami_id" {
  type        = string
  description = "Defime ami id of a instance"
}

variable "instance_type" {
  type        = string
  description = "Define the instance type"
}

variable "key_pair_name" {
  type        = string
  description = "Define key pair name for login or access to the instance "
}

variable "lb_target_group_name" {
  type        = string
  description = "Define load balancing target group name"
}


variable "lb_name" {
  type        = string
  description = "Define load balancing name"
}

variable "domain_name" {
    type = string
    description = "Define your domain name"
}

