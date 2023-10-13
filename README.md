# AWS Module for Github OIDC Authentication

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.17.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.additional_json](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.custom](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attach_custom_role_policy"></a> [attach\_custom\_role\_policy](#input\_attach\_custom\_role\_policy) | (Optional) Attach custom IAM policy | `bool` | `false` | no |
| <a name="input_custom_policy_json"></a> [custom\_policy\_json](#input\_custom\_policy\_json) | (Optional) An additional policy document as JSON to attach to the Github OIDC Role | `string` | `null` | no |
| <a name="input_github_oidc_thumbprint"></a> [github\_oidc\_thumbprint](#input\_github\_oidc\_thumbprint) | Github OIDC thumbprint | `list(string)` | n/a | yes |
| <a name="input_github_repository_conditions"></a> [github\_repository\_conditions](#input\_github\_repository\_conditions) | List of github repository conditions with repo:OWNER/REPOSITORY:environment:NAME | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name to be used on all the resources as identifier | `string` | n/a | yes |
| <a name="input_role_max_session_duration"></a> [role\_max\_session\_duration](#input\_role\_max\_session\_duration) | (Optional) Maximum session duration (in seconds) that you want to set for the specified role | `number` | `3600` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) The tags to apply to all taggable resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_github_role_arn"></a> [github\_role\_arn](#output\_github\_role\_arn) | AWS Role arn to use with Github |
<!-- END_TF_DOCS -->