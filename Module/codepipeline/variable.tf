variable "tf_codepipeline_artifact_bucket_name" {

description = " S3 bucket namenfor artifacts"
}
variable "tf_codepipeline_role_name" {

description = "CodePipeline IAM Role"
}
variable "tf_codepipeline_role_policy_name" {

description = "IAM Role Policy"
}
variable "tf_codepipeline_name" {

description = "CodePipeline Name"
}
variable "terraform_codecommit_repo_name" {

description = "CodeCommit repo name"
}
variable "codebuild_terraform_build_name" {

description = "codebuild name"
}
variable "codebuild_terraform_plan_name" {

description = "terraform plan name"
}
variable "codebuild_terraform_apply_name" {

description = "Terraform apply name"
}

variable "child_variable"{
    default= ""
}
