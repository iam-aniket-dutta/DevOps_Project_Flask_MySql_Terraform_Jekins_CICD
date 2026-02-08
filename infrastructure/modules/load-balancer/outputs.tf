output "lb_dns_name_out" {
  value = aws_lb.lb.dns_name
}


output "lb_zone_id" {
  value = aws_lb.lb.zone_id
}