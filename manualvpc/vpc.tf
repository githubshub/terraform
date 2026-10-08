# The VPC: your own private network

resource "aws_vpc" "main" {

  cidr_block           = var.vpc_cidr

  enable_dns_support   = true

  enable_dns_hostnames = true

 

  tags = {

    Name = "${var.name_prefix}-vpc"

  }

}

 

# Internet Gateway: the door from the VPC to the internet

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.main.id

 

  tags = {

    Name = "${var.name_prefix}-igw"

  }

}