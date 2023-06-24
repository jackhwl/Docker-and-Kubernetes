variable "subscription_id" {
  type = string
  description = "azure subscription id"
  sensitive = false
}

variable "client_id" {
  type = string
  description = "azure client id"
  sensitive = false
}

variable "client_secret" {
  type = string
  description = "azure client secret"
  sensitive = true
}