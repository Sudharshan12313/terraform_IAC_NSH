terraform {
  backend "s3" {
    bucket         = "nsh-tfstate"
    key            = "terraform/state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "nsh-state-locks"
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
  ami           = "ami-046d7944dd9e73a61"
  instance_type = "t2.micro"
  tags = {
    Name = "TO-BE-DELETED"
  }
}
