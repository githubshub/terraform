resource "aws_instance" "web" {

  ami                         = data.aws_ami.al2023.id

  instance_type               = var.instance_type

  subnet_id                   = data.aws_subnets.default.ids[0]

  vpc_security_group_ids      = [aws_security_group.web.id]

  iam_instance_profile        = aws_iam_instance_profile.profile.name

  associate_public_ip_address = true

 

  # Load the script and pass Terraform variables into it

  user_data = templatefile("${path.module}/userdata.sh.tpl", {

    instance_name = var.instance_name

    instance_type = var.instance_type

  })

 

  user_data_replace_on_change = true

 

  tags = {

    Name = var.instance_name

  }

}