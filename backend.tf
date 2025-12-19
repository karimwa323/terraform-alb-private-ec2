terraform {
  backend "s3" {
    bucket         = "lab1-nti-s3-bucket"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
