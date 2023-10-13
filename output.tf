output "github_role_arn" {
  description = "AWS Role arn to use with Github"
  value       = aws_iam_role.this.arn
}
