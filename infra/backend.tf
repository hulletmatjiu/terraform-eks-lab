terraform {
  backend "s3" {
    bucket         = "tfstate-hulletm-eks-lab"
    key            = "eks-lab/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tfstate-hulletm-eks-lab-lock"
    encrypt        = true
  }
}
