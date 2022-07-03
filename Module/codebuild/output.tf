output "codebuild_plan"{
    value=aws_codebuild_project.codebuild_project_terraform_plan
}
output "codebuild_build"{
    value=aws_codebuild_project.codebuild_project_terraform_build
}
output "codebuild_apply"{
    value=aws_codebuild_project.codebuild_project_terraform_apply
}