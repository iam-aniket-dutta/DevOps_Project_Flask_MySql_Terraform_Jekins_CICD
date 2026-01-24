region = "us-east-1"

created_by = "Aniket"

bucket_name = "flask-mysql-app"

vpc_cidr            = "10.0.0.0/16"
vpc_name            = "vpc-dev"
public_subnet_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidr = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zones  = ["us-east-1a", "us-east-1b"]

ami_id        = "ami-0b6c6ebed2801a5cb"
instance_name = "flask-app"
instance_type = "t2.micro"
key_pair_name = "cicd"


lb_target_group_name = "lb-target-grp-dev"
lb_name              = "lb-dev"
