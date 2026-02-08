
# Get route 53 hosted zone that already define in the AWS account
data "aws_route53_zone" "route53_hosted_zone" {
  name         = var.domain_name
  private_zone = false
}


# add A type record for sub domain
resource "aws_route53_record" "route53_A_record" {
  zone_id = data.aws_route53_zone.route53_hosted_zone.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.lb_dns_name
    zone_id                = var.lb_zone_id
    evaluate_target_health = true
  }
}
