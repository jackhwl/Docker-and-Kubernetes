variable "subscription_id" {
  type        = string
  description = "azure subscription id"
  sensitive   = false
}

variable "client_id" {
  type        = string
  description = "azure client id"
  sensitive   = false
}

variable "client_secret" {
  type        = string
  description = "azure client secret"
  sensitive   = true
}

variable "company" {
  type        = string
  description = "Company name for resource tagging"
  default     = "Globomantics"
}

variable "project" {
  type        = string
  description = "Project name for resource tagging"
}

variable "billing_code" {
  type        = string
  description = "Billing code for resource tagging"
}