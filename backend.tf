terraform {
  backend "s3" {
    bucket = "fun-bucket-123w"
    key = "ram/terraform.tfstate"
    region = "eu-north-1"
    
  }
}