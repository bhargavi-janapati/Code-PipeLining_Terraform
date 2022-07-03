resource "aws_iam_role" "codebuild_iam_role" {
name = var.codebuild_iam_role_name 
assume_role_policy=<<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Principal": {
"Service": "codebuild.amazonaws.com"
},
"Action": "sts:AssumeRole"
}
]
}
EOF
}
resource "aws_iam_role_policy" "codebuild_iam_role_policy" {
name = var.codebuild_iam_role_policy_name
role = aws_iam_role.codebuild_iam_role.name 
policy = <<POLICY
{
"Version": "2012-10-17",
"Statement": [
{
"Effect": "Allow",
"Resource": [
"*"
],
"Action": [
"logs:CreateLogGroup",
"logs:CreateLogStream",
"logs:PutLogEvents"
]
},
{
"Effect": "Allow",
"Action": [
"s3:*"
],
"Resource": "*"
},
{
"Effect": "Allow",
"Action": [
"dynamodb:*"
],
"Resource": "*"
},
{
"Effect": "Allow",
"Action": [
"codecommit:BatchGet*",
"codecommit:BatchDescribe*",
"codecommit:Describe*",
"codecommit:EvaluatePullRequestApprovalRules",
"codecommit:Get*",
"codecommit:List*",
"codecommit:GitPull"
],
"Resource": "*"
},
{
"Effect": "Allow",
"Action": [
"iam:Get*",
"iam:List*"
],
"Resource": "${aws_iam_role.codebuild_iam_role.arn}"
},
{
"Effect": "Allow",
"Action": "sts:AssumeRole",
"Resource": "${aws_iam_role.codebuild_iam_role.arn}"
}
]
}
POLICY
}
resource "aws_iam_role" "tf_iam_assumed_role" {
    name = "TerraformAssumedIamRole" 
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "${aws_iam_role.codebuild_iam_role.arn}"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

tags = {
   Terraform =  "True"
}
}

resource "aws_iam_policy" "tf_iam_assumed_policy" {
name = "TerraformAssumedIamPolicy"
policy = <<EOF
{
"Version": "2012-10-17",
"Statement": [
{
"Sid": "AllowAllPermissions",
"Effect": "Allow",
"Action": [
"*"
],
"Resource": "*"
}
]
}
EOF
}

resource "aws_iam_role_policy_attachment" "tf_iam_attach_assumed_role_to_permissions_policy" {
  role       = aws_iam_role.tf_iam_assumed_role.name
  policy_arn = aws_iam_policy.tf_iam_assumed_policy.arn
}