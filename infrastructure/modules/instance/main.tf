resource "aws_instance" "dev-flask-app" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  user_data                   = var.user_data
  vpc_security_group_ids      = [var.sg_name_for_ssh, var.sg_name_for_flask_app]
  key_name                    = var.key_pair_name
  associate_public_ip_address = true

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  tags = {
    Name      = var.instance_name
    CreatedBy = var.created_by
  }
}
