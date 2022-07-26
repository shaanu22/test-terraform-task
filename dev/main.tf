provider "aws" {
  region = "us-east-1"
}

module "myvpcapp" {
  source      = "../modules/vpc"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = module.myvpcapp.myvpc
  subnet_cidr = "192.168.1.0/24"
}

module "myec2app" {
  source        = "../modules/ec2"
  ec2_count     = "1"
  instance_type = "t2.micro"
  ami_id        = "ami-0cff7528ff583bf9a"
  subnet_id     = module.myvpcapp.subnet
}
