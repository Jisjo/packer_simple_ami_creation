
############################ Variable declaration ################################

variable "a_key" {
  type    = string
  default = "AKIAVOYUBUYWFVP7JDU4"
}
variable "s_key" {
  type    = string
  default = "B7OLY3ST6jth4gGDQ5AErdtcrujT2CiK1J6BUDj/"
}

variable "ami_id" {
  type    = string
  default = "ami-0108d6a82a783b352"
}

variable "user" {
  type    = string
  default = "ec2-user"
}

variable "app_name" {
  type    = string
  default = "httpd-webserver"
}

variable "region" {
  type    = string
  default = "ap-south-1"
}
variable "type" {
  type = string
  default = "t2.micro"
}


############################  AMI declaration ################################


source "amazon-ebs" "httpd-webserver" {
  ami_name      = "PACKER-DEMO-${var.app_name}"
  access_key    = "${var.a_key}"
  secret_key    = "${var.s_key}"
  instance_type = "${var.type}"
  region        = "${var.region}"
  source_ami    = "${var.ami_id}"
  associate_public_ip_address = true
  ssh_username  = "${var.user}"

  tags = {
    Name = "PACKER-DEMO-${var.app_name}"
  }
}

############################################# Building AMI #############################################

build {
  sources = ["source.amazon-ebs.httpd-webserver"]



  provisioner "shell" {
   
    script = "script.sh"
  }

}