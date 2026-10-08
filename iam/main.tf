# Create the IAM user

resource "aws_iam_user" "student" {

  name = "student-user"

 

  tags = {

    Purpose = "terraform-training"

  }

}

 

# Attach an AWS managed policy (EC2 read-only)

resource "aws_iam_user_policy_attachment" "ec2_readonly" {

  user       = aws_iam_user.student.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"

}