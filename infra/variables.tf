variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "eks-lab"
}

variable "site_bucket_name" {
  description = "Globally unique bucket name for the site content, e.g. eks-lab-site-yourname"
}

variable "location-test"{
default = "Pretoria"
}
