data "aws_iam_policy_document" "trust" {

  statement {

    actions = ["sts:AssumeRole"]

 

    principals {

      type        = "Service"

      identifiers = ["ec2.amazonaws.com"]

    }

  }

}

 

resource "aws_iam_role" "ec2_role" {

  name               = "${var.instance_name}-role"

  assume_role_policy = data.aws_iam_policy_document.trust.json

}

 

resource "aws_iam_role_policy_attachment" "ssm" {

  role       = aws_iam_role.ec2_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

}

 

resource "aws_iam_instance_profile" "profile" {

  name = "${var.instance_name}-profile"

  role = aws_iam_role.ec2_role.name

}