terraform {
  backend "s3" {
    bucket         = "nsh-tfstate"
    key            = "terraform/state/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "nsh-state-locks"
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "test" {
  bucket = "new-bucket-nsh-state-test"
  acl    = "private"
}

resource "aws_instance" "test-instance-terraform" {
  ami           = "ami-05d38da78ce859165"
  instance_type = "t2.micro"
  tags = {
    Name = "TO-BE-DELETED"
  }
}
