variable "created_by" {
  type        = string
  description = "Define created user name."
}

variable "lb_target_group_name" {
  type        = string
  description = "Define load balancer target group name."
}

variable "lb_target_group_port" {
  type        = number
  description = "Define load balancer target group port for recieving upcoming traffic."
}

variable "lb_target_grop_protocol" {
  type        = string
  description = "Define load balancer target group protocol to use for routing traffic to the targets."
}

variable "vpc_id" {
  type        = string
  description = "Define VPC id  in which to create the target group."
}

variable "instance_id" {
  type        = string
  description = "Define instance id for attaching to load balancing target groups."
}
