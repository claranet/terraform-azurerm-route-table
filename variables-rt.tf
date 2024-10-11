variable "bgp_route_propagation_enabled" {
  description = "Option to enable BGP route propagation on this Route Table."
  type        = bool
  default     = false
}

variable "force_tunneling_enabled" {
  description = "Option to enable a route to Force Tunneling (force 0.0.0.0/0 traffic through the Gateway next hop)."
  type        = bool
  default     = false
}
