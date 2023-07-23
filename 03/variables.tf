###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "ssh_key" {
  type        = string
  description = "ssh-key"
}

variable "vm_resources" {
  type = list(object( {
    vm_name       = string
    cores         = number
    memory        = number
    core_fraction = number
    disk          = number
  }))
  default = [
    { vm_name = "main", cores = 2, memory = 1, core_fraction = 20, disk = 10 },
    { vm_name = "replica", cores = 2, memory = 2, core_fraction = 20, disk = 15 }
  ]
  description = "Set VM resources"
}
