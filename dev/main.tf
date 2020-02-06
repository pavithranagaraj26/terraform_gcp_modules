# provider "aws" {
#   profile = "dev" 
#   region = "eu-central-1"
# }

# module "my_vpc" {
#   source      = "../modules/vpc"
#   vpc_cidr    = "192.168.0.0/16"
#   tenancy     = "default"
#   vpc_id      = "${module.my_vpc.vpc_id}"
#   subnet_cidr = "192.168.1.0/24"
# }

# module "my_ec2" {
#   source        = "../modules/ec2"
#   ec2_count     = 1
#   ami_id        = "ami-0b418580298265d5c"
#   instance_type = "t2.micro"
#   subnet_id     = "${module.my_vpc.subnet_id}"
# }

provider "google" {
	# credentials = "credentials.json" 
	project		= "ia-devops"
	region		= "us-central1"
}

module "my_vpc" {
  source = "../modules/vpc" 
  vpc_id = "${module.my_vpc.vpc_id}"
}

module "my_instance" {
  source = "../modules/gcp_instance"
  ami_id ="${module.my_instance.ami}"
  subnet_id = "${module.vpc.subnet_id}"
}

