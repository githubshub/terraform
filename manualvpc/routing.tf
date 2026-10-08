# Public route table: 0.0.0.0/0 goes to the Internet Gateway

resource "aws_route_table" "public" {

  vpc_id = aws_vpc.main.id

 

  route {

    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.igw.id

  }

 

  tags = {

    Name = "${var.name_prefix}-public-rt"

  }

}

 

# Attach every public subnet to the public route table

resource "aws_route_table_association" "public" {

  count = length(aws_subnet.public)

 

  subnet_id      = aws_subnet.public[count.index].id

  route_table_id = aws_route_table.public.id

}

 

# Private route table: no internet route (local traffic only)

resource "aws_route_table" "private" {

  vpc_id = aws_vpc.main.id

 

  tags = {

    Name = "${var.name_prefix}-private-rt"

  }

}

 

resource "aws_route_table_association" "private" {

  count = length(aws_subnet.private)

 

  subnet_id      = aws_subnet.private[count.index].id

  route_table_id = aws_route_table.private.id

}