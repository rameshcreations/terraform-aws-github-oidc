variable "tags" {
  description = "(Optional) The tags to apply to all taggable resources"
  type        = map(string)
  default     = {}
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "github_oidc_thumbprint" {
  description = "Github OIDC thumbprint"
  type        = list(string)
}

variable "github_repository_conditions" {
  description = "List of github repository conditions with repo:OWNER/REPOSITORY:environment:NAME"
  type        = list(string)
}

variable "attach_custom_role_policy" {
  description = "(Optional) Attach custom IAM policy"
  type        = bool
  default     = false
}

variable "custom_policy_json" {
  description = "(Optional) An additional policy document as JSON to attach to the Github OIDC Role"
  type        = string
  default     = null
}

variable "role_max_session_duration" {
  description = "(Optional) Maximum session duration (in seconds) that you want to set for the specified role"
  type        = number
  default     = 3600
}