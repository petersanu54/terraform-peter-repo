resource "aws_iam_instance_profile" "iamprofile" {
  name = "ec2-admin"
  role = aws_iam_role.iamrole.name
}

output "iaminstanceprofile" {
  value = aws_iam_instance_profile.iamprofile.name
}

