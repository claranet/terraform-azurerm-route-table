# Azure Route Table
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/rg/azurerm/)

This feature creates an [Azure Route Table](https://docs.microsoft.com/en-us/azure/virtual-network/manage-route-table) 
with an option to create a Force Tunneling route ([more informations](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-forced-tunneling-rm)).
You need to associate this Route Table with any subnet that needs thoses special routing features.

## Terraform version compatibility

| Module version | Terraform version |
|----------------|-------------------|
| >= 2.x.x       | 0.12.x            |
| < 2.x.x        | 0.11.x            |

## Usage
This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool which set some terraform variables in the environment needed by this module.
 
More details about variables set by the terraform-wrapper available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure-region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location     = module.azure-region.location
  client_name  = var.client_name
  environment  = var.environment
  stack        = var.stack
}

module "azure-network-vnet" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment      = var.environment
  location         = module.azure-region.location
  location_short   = module.azure-region.location_short
  client_name      = var.client_name
  stack            = var.stack

  resource_group_name = module.rg.resource_group_name
  vnet_cidr           = ["10.10.1.0/16"]
}

module "azure-network-route-table" {
  source  = "claranet/route-table/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.resource_group_name
  location            = module.azure-region.location
  location_short      = module.azure-region.location_short

  # You can set either a prefix for generated name or a custom one for the resource naming
  custom_name = local.custom_rt_name

  # Options
  disable_bgp_route_propagation = "false"

  enable_force_tunneling = "true"

  extra_tags = {
    managed_by = "Network admin department"
  }
}

resource "azurerm_route" "custom-route" {
  name                = "acceptanceTestRoute1"
  resource_group_name = module.rg.resource_group_name
  route_table_name    = module.azure-network-route-table.route_table_name
  address_prefix      = "10.1.0.0/16"
  next_hop_type       = "vnetlocal"
}

module "azure-network-subnet" {
  source  = "claranet/subnet/azurerm"
  version = "x.x.x"

  environment           = var.environment
  location_short        = module.azure-region.location_short
  client_name           = var.client_name
  stack                 = var.stack
  custom_subnet_names   = var.custom_subnet_names

  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = module.azure-network-vnet.virtual_network_name
  subnet_cidr_list     = ["10.10.1.0/24"]

  # Those lists must be the same size as the associated count value and `subnet_cidr_list` size and or not set (default count value is "0")
  # This limitation should be removed with Terraform 0.12
  route_table_count            = "1"
  route_table_ids              = [module.azure-network-route-table.route_table_id]
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| client\_name | Client name/account used in naming | string | n/a | yes |
| custom\_name | Custom Route table name, generated if not set | string | `""` | no |
| disable\_bgp\_route\_propagation | Option to disable BGP route propagation on this Route Table. | string | `"false"` | no |
| enable\_force\_tunneling | Option to enable a route to Force Tunneling (force 0.0.0.0/0 traffic through the Gateway next hop). | string | `"false"` | no |
| environment | Project environment | string | n/a | yes |
| extra\_tags | Additional tags to associate with your resources. | map | `<map>` | no |
| location | Azure region to use | string | n/a | yes |
| location\_short | Short string for Azure location | string | n/a | yes |
| name\_prefix | Optional prefix for VPN Gateway name | string | `""` | no |
| resource\_group\_name | Name of the resource group | string | n/a | yes |
| stack | Project stack name | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| route\_force\_tunneling | Force tunneling route status |
| route\_table\_id | Route table ID |
| route\_table\_name | Route table name |

## Related documentation

- Terraform documentation: [https://www.terraform.io/docs/providers/azurerm/r/route_table.html]
- Azure documentation: [https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-forced-tunneling-rm]
