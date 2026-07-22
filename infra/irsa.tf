module "nginx_site_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.0"

  role_name = "${var.cluster_name}-nginx-site"

  oidc_providers = {
    main = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["default:nginx-site"]
    }
  }
}

resource "aws_iam_policy" "nginx_site_s3_read" {
  name = "${var.cluster_name}-nginx-site-s3-read"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["s3:GetObject", "s3:ListBucket"]
        Resource = [
          aws_s3_bucket.site_content.arn,
          "${aws_s3_bucket.site_content.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "nginx_site_s3_read" {
  role       = module.nginx_site_irsa.iam_role_name
         policy_arn = aws_iam_policy.nginx_site_s3_read.arn
}
