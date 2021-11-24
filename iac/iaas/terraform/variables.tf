variable "alias" {
  default = "cka"
}
variable "location" {
  default = "eastus"
}
variable "address_prefix" {
  default = "10.0.0.0/16"
}
variable "master_nodes" {
  default = 1
}
variable "master_node_size" {
  default = "Standard_D2as_v4"
}
variable "worker_nodes" {
  default = 2
}
variable "worker_node_size" {
  default = "Standard_D2as_v4"
}
variable "node_user" {
  default = "k8s"
}
