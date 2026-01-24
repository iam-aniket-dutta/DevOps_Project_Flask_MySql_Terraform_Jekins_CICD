variable "created_by" {
  type        = string
  description = "Define created user name."
}

variable "lb_name" {
  type = string
  description = "Define load balancer name"
}

variable "lb_type" {
  type = string
  description = "Define load balancer name"
}

variable "sg_name_for_ssh" {
  type = string
  description = "Define secuirity group for ssh connecion"
}

variable "subnet_ids" {
  type = list(string)
  description = "Define public sunbet ids"
}

variable "lb_target_group_arn" {
  type = string
  description = "Define load balanncer target group arn"
}

variable "lb_listener_port" {
   type = string
  description = "Define load balanncer listener port"
}

variable "lb_listener_protocol" {
   type = string
  description = "Define load balanncer listener pootocol"
}

variable "lb_listener_default_action" {
   type = string
  description = "Define load balanncer listener action"
}

variable "lb_target_group_attachment_port" {
   type = string
  description = "Define load balanncer target group attcahment port"
}