output "website_url" {

  value = "http://${aws_instance.web.public_ip}"

}

 

output "instance_id" {

  value = aws_instance.web.id

}

 

output "ami_used" {

  value = data.aws_ami.al2023.id

}