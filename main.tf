terraform {
  required_version = "0.11.13"
}

provider "aws" {
    backend "s3"  {
      bucket  = "terraform-state-satya"
      key = "global/s3/terraform.tfstate"
      region = "ap-south-1"
      dynamodb_table  = "terraform-state-locking"
      encrypt = true
    }
  region = "ap-south-1"
  version = "~> 2.0"
  shared_credentials_file = "/home/bitnami/.aws/credentials"
}

resource "aws_instance" "example" {
  ami           = "ami-0cb0e70f44e1a4bb5"
  instance_type = "t2.micro"
  tags = {
    Name = "JenkinsSatya23"
    }
 }
