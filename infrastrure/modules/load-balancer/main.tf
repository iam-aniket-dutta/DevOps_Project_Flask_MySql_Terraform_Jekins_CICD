# Define appliaction load balancer resource
resource "aws_lb" "lb" {
  name                       = var.lb_name
  internal                   = false
  load_balancer_type         = var.lb_type
  security_groups            = [var.sg_name_for_ssh]
  subnets                    = var.subnet_ids
  enable_deletion_protection = false

  tags = {
    Name       = "lb-dev"
    created_by = var.created_by
  }

}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = var.lb_listener_port
  protocol          = var.lb_listener_protocol
  default_action {
    type             = var.lb_listener_default_action
    target_group_arn = var.lb_target_group_arn
  }
}
