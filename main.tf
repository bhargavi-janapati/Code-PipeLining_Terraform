module "codecommit" {
source = "./Modules/codecommit"
child_variable= var.repo_name
}
module "codebuild" {
source = "./Modules/codebuild"
codebuild_project_terraform_build_name = "TerraformBuild"
codebuild_project_terraform_plan_name = "TerraformPlan"
codebuild_project_terraform_apply_name = "TerraformApply"
codebuild_iam_role_arn = module.iam.codebuild_arn

}
module "iam" {
source = "./Modules/iam"
codebuild_iam_role_name = "CodeBuildIamRole"
codebuild_iam_role_policy_name = "CodeBuildIamRolePolicy"

}
module "codepipeline" {
source = "./Modules/codepipeline"
tf_codepipeline_name = var.repo_name
tf_codepipeline_artifact_bucket_name = var.bucket_name
tf_codepipeline_role_name = "TerraformCodePipelineIamRole"
tf_codepipeline_role_policy_name = "TerraformCodePipelineIamRolePolicy"
terraform_codecommit_repo_name = module.codecommit.codecommit_repo
codebuild_terraform_build_name = module.codebuild.codebuild_build
codebuild_terraform_plan_name = module.codebuild.codebuild_plan
codebuild_terraform_apply_name = module.codebuild.codebuild_apply
}