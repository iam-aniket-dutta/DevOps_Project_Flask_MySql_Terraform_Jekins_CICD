
# Create load balancer target group resource
resource "aws_lb_target_group" "lb_target_group" {
  name     = var.lb_target_group_name
  port     = var.lb_target_group_port
  protocol = var.lb_target_grop_protocol
  vpc_id   = var.vpc_id

  health_check {
    path                = "/health"
    port                = 5000
    healthy_threshold   = 4
    unhealthy_threshold = 2
    timeout             = 2
    interval            = 5
    matcher             = "200"
  }

  tags = {
    Name      = "lb_target_group"
    CreatedBy = var.created_by
  }

}


resource "aws_lb_target_group_attachment" "lb_target_group_attach" {
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = var.instance_id
  port             = 5000
}
