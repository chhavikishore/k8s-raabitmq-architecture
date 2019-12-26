variable "url" {
    type = string
    default = "http://127.0.0.1:15672"
} 

variable "username" {
    type = string
    default = "guest"
}

variable "password" {
    type = string
    default = "guest"
}


provider "rabbitmq" {
    endpoint = var.url
    username = var.username
    password = var.password
}