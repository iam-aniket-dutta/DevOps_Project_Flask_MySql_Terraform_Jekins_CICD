
# Security group for allow shh , http , https connecion 
resource "aws_security_group" "sg_for_ssh_http" {
  vpc_id      = var.vpc_id
  description = "Security group for SSH , HTTP & HTTPS connection"

  # ingress for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    description = "Allow remote SSH from anywhere"
  }

  # ingress for HTTP
  ingress {
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    description = "Allow remote HTTP from anywhere"
  }

  # ingress for HTTPS
  ingress {
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    description = "Allow remote HTTPS from anywhere"
  }

  # egress
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow out going traffic to anywhere"
  }

  tags = {
    Name      = "ssh-http-sg"
    CreatedBy = var.created_by
  }
}


# Security group for access RDS(Relational Database Service)
resource "aws_security_group" "sg_for_rds" {
  vpc_id      = var.vpc_id
  description = "Allow access to RDS from EC2 present in public subnet"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.public_subnet_cidr
  }

  tags = {
    Name      = "rds-sg"
    CreatedBy = var.created_by
  }
}


# Security group for access flask app
resource "aws_security_group" "sg_for_flask_app" {
  vpc_id      = var.vpc_id
  description = "Enable the Port 5000 for python api"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow traffic on port 5000"
  }

  tags = {
    Name      = "flask-app-sg"
    CreatedBy = var.created_by
  }
}
