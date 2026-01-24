# VPC module
module "vpc_module" {
  source              = "./modules/vpc"
  created_by          = var.created_by
  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zones  = var.availability_zones
}


# Secruity Grup module
module "sg_module" {
  source             = "./modules/security-group"
  created_by         = var.created_by
  vpc_id             = module.vpc_module.vpc_id_out                     # Get VPC id from VPC module
  public_subnet_cidr = tolist(module.vpc_module.public_subnet_cidr_out) # Get public subnet CIDR block id from VPC module
}


# Instance module
module "instance_module" {
  source                = "./modules/instance"
  created_by            = var.created_by
  instance_name         = var.instance_name
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  subnet_id             = tolist(module.vpc_module.publice_subnet_id_out)[0] # Get public subnet id from VPC module, its return multiple ids, here take only one id
  key_pair_name         = var.key_pair_name
  sg_name_for_ssh       = module.sg_module.sg_for_ssh_http_out
  sg_name_for_flask_app = module.sg_module.sg_for_flask_app_out
  user_data             = templatefile("./instance-user-data/install-appache.sh", {})
}


# RDS module
module "rds_module" {
  source          = "./modules/rds"
  created_by      = var.created_by
  subnet_ids      = tolist(module.vpc_module.publice_subnet_id_out)
  sg_name_for_rds = module.sg_module.sg_for_rds_out
  db_user         = "root"
  db_password     = "aniket"
  db_database     = "flaskdb"
}


# Load Balncer Target Group module
module "lb_target_group_module" {
  source                  = "./modules/lb-traget-groups"
  created_by              = var.created_by
  lb_target_group_name    = var.lb_target_group_name
  lb_target_grop_protocol = "HTTP"
  lb_target_group_port    = 5000
  vpc_id                  = module.vpc_module.vpc_id_out
  instance_id             = module.instance_module.instance_id_out
}


# Load Balncer module
module "lb_module" {
  source                          = "./modules/load-balancer"
  created_by                      = var.created_by
  lb_name                         = var.lb_name
  lb_type                         = "application"
  sg_name_for_ssh                 = module.sg_module.sg_for_ssh_http_out
  subnet_ids                      = tolist(module.vpc_module.publice_subnet_id_out)
  lb_target_group_arn             = module.lb_target_group_module.lb_target_group_arn_out
  lb_listener_port                = 5000
  lb_listener_protocol            = "HTTP"
  lb_listener_default_action      = "forward"
  lb_target_group_attachment_port = 5000
}
