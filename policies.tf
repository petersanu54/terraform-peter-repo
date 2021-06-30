resource "aws_iam_role_policy" "iamadminpolicy" {
  name = "admin_policy"
  role = aws_iam_role.iamrole.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "*",
        "Resource" : "*"
      }
    ]
  })
}


output "iaminstancepolicy" {
  value = aws_iam_role_policy.iamadminpolicy.name
}
