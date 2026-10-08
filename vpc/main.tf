# READ the existing default VPC (nothing is created)

data "aws_vpc" "default" {

  default = true

}

 

# READ all subnets inside that VPC

data "aws_subnets" "default" {

  filter {

    name   = "vpc-id"

    values = [data.aws_vpc.default.id]

  }

}

 

# READ details of the first subnet

data "aws_subnet" "first" {

  id = data.aws_subnets.default.ids[0]

}