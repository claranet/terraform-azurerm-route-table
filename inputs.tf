# Global variables
variable "resource_group_name" {
  description = "Name of the resource group"
}

variable "location" {
  description = "Azure region to use"
}

variable "location_short" {
  description = "Short string for Azure location"
}

variable "environment" {
  description = "Project environment"
}

variable "stack" {
  description = "Project stack name"
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

variable "name_prefix" {
  description = "Optional prefix for VPN Gateway name"
  type        = string
  default     = ""
}

variable "custom_name" {
  description = "Custom Route table name, generated if not set"
  default     = ""
}

variable "extra_tags" {
  description = "Additional tags to associate with your resources."
  type        = map(string)
  default     = {}
}

variable "disable_bgp_route_propagation" {
  description = "Option to disable BGP route propagation on this Route Table."
  type        = string
  default     = "false"
}

variable "enable_force_tunneling" {
  description = "Option to enable a route to Force Tunneling (force 0.0.0.0/0 traffic through the Gateway next hop)."
  type        = string
  default     = "false"
}

