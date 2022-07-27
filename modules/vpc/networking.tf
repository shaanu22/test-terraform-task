resource "aws_vpc" "main-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.tenancy

  tags = {
    Name = "main-shaanu"
  }
}

resource "aws_subnet" "main-subnet" {
  vpc_id     = aws_vpc.main-vpc.id
  cidr_block = var.subnet_cidr

  tags = {
    Name = "Main-Subnet"
  }
}

output "myvpc" {
  value = aws_vpc.main-vpc.id
}

output "subnet" {
  value = aws_subnet.main-subnet.id
}
