# Read the available Availability Zones in this region

data "aws_availability_zones" "available" {

  state = "available"

}

 

# Public subnets (one per CIDR in the list)

resource "aws_subnet" "public" {

  count = length(var.public_subnet_cidrs)

 

  vpc_id                  = aws_vpc.main.id

  cidr_block              = var.public_subnet_cidrs[count.index]

  availability_zone       = data.aws_availability_zones.available.names[count.index]

  map_public_ip_on_launch = true

 

  tags = {

    Name = "${var.name_prefix}-public-${count.index + 1}"

    Tier = "public"

  }

}

 

# Private subnets

resource "aws_subnet" "private" {

  count = length(var.private_subnet_cidrs)

 

  vpc_id            = aws_vpc.main.id

  cidr_block        = var.private_subnet_cidrs[count.index]

  availability_zone = data.aws_availability_zones.available.names[count.index]

 

  tags = {

    Name = "${var.name_prefix}-private-${count.index + 1}"

    Tier = "private"

  }

}