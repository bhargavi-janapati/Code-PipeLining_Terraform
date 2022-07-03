output "codebuild_arn"{
    value=aws_iam_role.codebuild_iam_role.arn
}

output "codebuild_policy_arn"{
    value=aws_iam_role.tf_iam_assumed_role.arn
}