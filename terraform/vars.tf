variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/id_rsa"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "~/.ssh/id_rsa.pub"
}
variable "AMIS" {
  default = "ami-064ab8637cf33f1bb"
}
