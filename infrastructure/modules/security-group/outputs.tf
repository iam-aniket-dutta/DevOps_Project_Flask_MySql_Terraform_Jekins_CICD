output "sg_for_ssh_http_out" {
  value = aws_security_group.sg_for_ssh_http.id
}

output "sg_for_rds_out" {
  value = aws_security_group.sg_for_rds.id
}

output "sg_for_flask_app_out" {
  value = aws_security_group.sg_for_flask_app.id
}
