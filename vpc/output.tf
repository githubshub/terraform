output "vpc_id" {

  value = data.aws_vpc.default.id

}

 

output "vpc_cidr" {

  value = data.aws_vpc.default.cidr_block

}

 

output "subnet_ids" {

  value = data.aws_subnets.default.ids

}

 

output "first_subnet_az" {

  value = data.aws_subnet.first.availability_zone

}