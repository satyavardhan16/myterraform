terraform {
  required_version = "0.11.13"
}
resource "aws_s3_bucket" "terraform_state" {
    bucket  = "terraform-state-satya"
  
  lifecycle {
    prevent_destroy = true
    }
  
  versioning  {
    enabled = true
    }
  server_side_encryption_configuration {
    rule  {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
        }
      }
    }
  }

resource "aws_dynamodb_table" "terraform_locks" {
  name  = "terraform-state-locking"
  billing_mode = "PAY_PER_REQUEST"
  hash_key  = "LockID"
  
  attribute {
    name  = "LockID"
    type  = "S"
    }
  }
  
resource "aws_db_instance" "default" {
  allocated_storage = 5
  storage_type  = "gp2"
  engine  = "mysql"
  engine_version  = "5.7"
  instance_class  = "db.t2.micro"
  name  = "mydb"
  username  = "foo"
  password  = "qweiop10"
  parameter_group_name  = "default.mysql5.7"
  skip_final_snapshot = true
 }

provider "aws" {
  region = "ap-south-1"
  version = "~> 2.0"
  shared_credentials_file = "/home/bitnami/.aws/credentials"
}

resource "aws_instance" "example" {
  ami           = "ami-0cb0e70f44e1a4bb5"
  instance_type = "t2.micro"
  tags = {
    Name = "JenkinsSatya232s"
    }
 }
