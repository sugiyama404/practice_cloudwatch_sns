variable "app_name" {}
locals {
  email_txt = file("src/email.txt")
}
