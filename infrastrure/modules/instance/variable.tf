variable "created_by" {
  type        = string
  description = "Define created user name."
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

variable "subnet_id" {
  type        = string
  description = "Define specific subnet where server will configure"
}

variable "key_pair_name" {
  type        = string
  description = "Define key pair name for login or access to the instance "
}

variable "sg_name_for_ssh" {
  type        = string
  description = "Define security group for connectiong to instance using SSH"
}

variable "sg_name_for_flask_app" {
  type        = string
  description = "Define security group name for accessing flask app from browser"
}

variable "user_data" {
  description = "Define user data for automaic installing some packages while setup instance"
}
