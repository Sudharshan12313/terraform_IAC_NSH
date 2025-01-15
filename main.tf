terraform {
  backend "s3" {
    bucket         = "example-terraform-state-bucket"
    key            = "terraform/state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test" {
  bucket = "test_bucket_nsh"
  acl    = "private"
}

resource "aws_instance" "test_instance" {
  ami           = "ami-0c94855ba95c71c99"
  instance_type = "t2.micro"
  tags = {
    Name = "TO-BE-DELETED"
  }
}
