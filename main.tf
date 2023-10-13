data "aws_iam_policy_document" "this" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.this.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      values   = var.github_repository_conditions
    }
  }
}

resource "aws_iam_policy" "additional_json" {
  count = var.attach_custom_role_policy && var.custom_policy_json != null ? 1 : 0

  name   = format("%s-%s", var.name, "github-iac-oidc-policy")
  policy = var.custom_policy_json
  tags   = var.tags
}

#Identity Provider
resource "aws_iam_openid_connect_provider" "this" {
  url = "https://token.actions.githubusercontent.com"
  client_id_list = [
    "sts.amazonaws.com",
  ]
  #https://gist.github.com/guitarrapc/8e6b68f21bc1eef8e7b66bde477d5859?permalink_comment_id=4027755#file-_get_github_oidc_thumbprint-sh
  thumbprint_list = var.github_oidc_thumbprint
}

#IAM Role for Github
resource "aws_iam_role" "this" {
  name                 = format("%s-%s", var.name, "github-iac-oidc")
  assume_role_policy   = data.aws_iam_policy_document.this.json
  max_session_duration = var.role_max_session_duration
  tags                 = var.tags
}

#IAM Role Policy attachment - Admin Default
resource "aws_iam_role_policy_attachment" "this" {
  count      = var.attach_custom_role_policy ? 0 : 1
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

#IAM Role Policy attachment - Custom
resource "aws_iam_role_policy_attachment" "custom" {
  count      = var.attach_custom_role_policy && var.custom_policy_json != null ? 1 : 0
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.additional_json[0].arn
}


