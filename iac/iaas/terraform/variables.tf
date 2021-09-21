variable "alias" {
  default = "cka"
}
variable "location" {
  default = "eastus"
}
variable "address_prefix" {
  default = "10.0.0.0/16"
}
variable "nodes" {
  default = 3
}
variable "node_size" {
  default = "Standard_F2"
}

variable "admin_user" {
  default = "adminuser"
}
