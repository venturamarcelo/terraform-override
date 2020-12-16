provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "web" {
  ami           = "ami-408c7f28"
  instance_type = "t3.2xlarge"

  tags = {
    Name = "HelloWorld"
  }
}