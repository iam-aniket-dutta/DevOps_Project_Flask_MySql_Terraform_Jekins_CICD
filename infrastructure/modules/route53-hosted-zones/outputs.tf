output "route53_hosted_zone_id_out" {
  value = data.aws_route53_zone.route53_hosted_zone.zone_id
}
