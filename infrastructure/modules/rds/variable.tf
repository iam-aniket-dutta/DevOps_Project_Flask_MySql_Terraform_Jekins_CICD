variable "created_by" {
  type        = string
  description = "Define created user name."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Define subnet id for creating database instance" # Private subnet
}

variable "sg_name_for_rds" {
  type        = string
  description = "Define security group name for accessing database instance"
}

variable "db_user" {
  type        = string
  description = "Define database user name"
}

variable "db_password" {
  type        = string
  description = "Define database password"
}

variable "db_database" {
  type        = string
  description = "Define database name"
}
