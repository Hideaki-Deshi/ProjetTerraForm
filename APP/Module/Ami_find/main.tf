provider "aws" {
    region = "us-east-1"
    access_key = "${file("./SecretKey/access_key")}"
    secret_key = "${file("./SecretKey/secret_key")}"
}

data "aws_ami" "n_ami"{
    most_recent = true
    owners = [var.OS]

    filter {
      name = "name"
      values = [var.filtre]
    }
}