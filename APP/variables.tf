variable "region" {
  default = "us-east-1"
}

variable "instancetype" {
  default = "t2.nano"
}

variable "instanceEC2Name" {
  type = map
}

variable "instanceEbsName" {
  default = "EBSname"
}


variable "varOs" {
  default = "amazon"
}

variable "filter-OS" {
  default = "amzn2-ami-hvm*"
}
