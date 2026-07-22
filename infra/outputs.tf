output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "site_bucket" {
  value = aws_s3_bucket.site_content.bucket
}

output "irsa_role_arn" {
  value = module.nginx_site_irsa.iam_role_arn
}

