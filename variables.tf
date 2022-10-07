variable "my_name" {
  description = "This will be used as a part of resource name. For example John Doe -> jodo"
  default     = ""
}

variable "org" {
  description = "Organization name. Use agreed abbrevation to keep below 6 digits"
  default     = ""
}

variable "env" {
  description = "Environment name"
  default     = "test"
}

variable "sub" {
  description = "Subscription name"
  default     = "sandbox"
}

variable "location_short" {
  description = "Azure region"
  default     = "weu"
}

variable "location_long" {
  description = "Azure region"
  default     = "West Europe"
}

variable "admin_un" {
  description = "VM admin user name. For example John Doe -> adm-john"
  default     = ""
}

variable "subscription_id" {
  description = "Sandbox Subscription ID"
  default     = ""
}

variable "tenant_id" {
  description = "Tenant ID where sandbox Subscription is located"
  default     = ""
}
