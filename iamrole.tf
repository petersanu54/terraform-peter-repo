resource "aws_iam_role" "iamrole" {
  name = "admin-role"
  path = "/"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}



output "iaminstancerole" {
  value = aws_iam_role.iamrole.name
}