resource "aws_codepipeline" "tf_codepipeline" {
for_each=var.tf_codepipeline_name
name=each.value
role_arn = aws_iam_role.tf_codepipeline_role.arn
artifact_store {
location = aws_s3_bucket.tf_codepipeline_artifact_bucket[each.key].bucket
type = "S3"
}
stage {
name = "Source"
action {
name = "Source"
category = "Source"
owner = "AWS"
provider = "CodeCommit"
version = "1"
output_artifacts = ["SourceArtifact"]
configuration = {
RepositoryName = each.key
BranchName = "main"
}
}
}
stage {
name = "Build"
action {
name = "Build"
category = "Build"
owner = "AWS"
provider = "CodeBuild"
input_artifacts = ["SourceArtifact"]
version = "1"
configuration = {
ProjectName = "TerraformBuild"
}
}
}
stage {
name = "Terraform_Plan"
action {
name = "Terraform-Plan"
category = "Build"
owner = "AWS"
provider = "CodeBuild"
input_artifacts = ["SourceArtifact"]
version = "1"
configuration = {
ProjectName = "TerraformPlan"
}
}
}
stage {
name = "Manual_Approval"
action {
name = "Manual-Approval"
category = "Approval"
owner = "AWS"
provider = "Manual"
version = "1"
}
}
stage {
name = "Terraform_Apply"
action {
name = "Terraform-Apply"
category = "Build"
owner = "AWS"
provider = "CodeBuild"
input_artifacts = ["SourceArtifact"]
version = "1"
configuration = {
ProjectName = "TerraformApply"
}
}
}
}