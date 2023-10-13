module "oidc" {
  source = "../../"
  name   = "demo-project"
  #openssl s_client -servername token.actions.githubusercontent.com -showcerts -connect token.actions.githubusercontent.com:443 < /dev/null 2>/dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | sed "0,/-END CERTIFICATE-/d" > certificate.crt
  #openssl x509 -in certificate.crt -fingerprint -noout | cut -f2 -d'=' | tr -d ':' | tr '[:upper:]' '[:lower:]'
  github_oidc_thumbprint = ["1c58a3a8518e8759bf075b76b750d4f2df264fcd"]

  github_repository_conditions = [
    "repo:rameshcreations/iac-helpers:*"
  ]

  attach_custom_role_policy = true

  custom_policy_json = <<-EOT
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Action": [
                    "ec2:*"
                ],
                "Resource": ["*"]
            }
        ]
    }
  EOT
}
