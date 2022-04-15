# Global variables
variable "location" {
  description = "Azure location."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

variable "environment" {
  description = "Project environment"
  type        = string
}

variable "stack" {
  description = "Project stack name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "disable_bgp_route_propagation" {
  description = "Option to disable BGP route propagation on this Route Table."
  type        = bool
  default     = false
}

variable "enable_force_tunneling" {
  description = "Option to enable a route to Force Tunneling (force 0.0.0.0/0 traffic through the Gateway next hop)."
  type        = bool
  default     = false
}
