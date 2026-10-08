variable "aws_region" {

  description = "AWS region"

  type        = string

  default     = "ap-south-1"

}

 

variable "name_prefix" {

  description = "Prefix used in all resource names"

  type        = string

  default     = "student"

}

 

variable "vpc_cidr" {

  description = "CIDR block of the VPC"

  type        = string

  default     = "10.1.0.0/16"

}

 

variable "public_subnet_cidrs" {

  description = "CIDR blocks for public subnets"

  type        = list(string)

  default     = ["10.1.1.0/24", "10.1.2.0/24"]

}

 

variable "private_subnet_cidrs" {

  description = "CIDR blocks for private subnets"

  type        = list(string)

  default     = ["10.1.11.0/24", "10.1.12.0/24"]

}