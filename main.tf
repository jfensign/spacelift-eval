variable "byte_length" {
  type = number
  default = 5
}

variable "account_labels" {
  type = string
}

variable "lock_test" {
  type = string
  default = "should-not-appear"
}

locals {
  "labels" = jsondecode(var.account_labels)
}

resource "random_id" "random" {
  keepers = {
    uuid = uuid()
  }
  byte_length = var.byte_length
}

output "random" {
  value = random_id.random.hex
}

output "labels" {
  value = local.labels
}

output "random_id" {
  value = random_id.random.id
}

output "lock_test" {
  value = var.lock_test
}
