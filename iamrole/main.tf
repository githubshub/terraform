# Trust policy: WHO can assume this role? -> the EC2 service

data "aws_iam_policy_document" "trust" {

  statement {

    effect  = "Allow"

    actions = ["sts:AssumeRole"]

 

    principals {

      type        = "Service"

      identifiers = ["ec2.amazonaws.com"]

    }

  }

}

 

# The role

resource "aws_iam_role" "ec2_role" {

  name               = "student-ec2-role"

  assume_role_policy = data.aws_iam_policy_document.trust.json

}

 

# Permissions: WHAT can the role do? -> Session Manager access

resource "aws_iam_role_policy_attachment" "ssm" {

  role       = aws_iam_role.ec2_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"

}

 

# EC2 needs an instance profile to use a role

resource "aws_iam_instance_profile" "profile" {

  name = "student-ec2-profile"

  role = aws_iam_role.ec2_role.name

}