variable "byte_length" {
  type = number
  default = 5
}

variable "lock_test" {
  type = string
  default = "should-not-appear"
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

output "random_id" {
  value = random_id.random.id
}

output "lock_test" {
  value = var.lock_test
}
