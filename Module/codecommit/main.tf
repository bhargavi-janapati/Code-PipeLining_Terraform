resource "aws_codecommit_repository" "repo" {
for_each=var.child_variable
repository_name = each.key

description = "Repo used by codecommit"
}
