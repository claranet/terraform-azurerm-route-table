# Azure Route Table

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/route-table/azurerm/)

This feature creates an [Azure Route Table](https://docs.microsoft.com/en-us/azure/virtual-network/manage-route-table)
with an option to create a [Force Tunneling route](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-forced-tunneling-rm).
You need to associate this Route Table with any subnet that needs those special routing features.

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
module "route_table" {
  source  = "claranet/route-table/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.name
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short

  # You can set either a prefix for generated name or a custom one for the resource naming
  #custom_name = "my_route_table"

  # Options
  bgp_route_propagation_enabled = false
  force_tunneling_enabled       = true

  extra_tags = {
    foo = "bar"
  }
}

resource "azurerm_route" "custom_route" {
  name                = "acceptanceTestRoute1"
  resource_group_name = module.rg.name
  route_table_name    = module.route_table.name
  address_prefix      = "10.1.0.0/16"
  next_hop_type       = "VnetLocal"
}

# module "vnet" {
#   source  = "claranet/vnet/azurerm"
#   version = "x.x.x"

#   environment    = var.environment
#   location       = module.azure_region.location
#   location_short = module.azure_region.location_short
#   client_name    = var.client_name
#   stack          = var.stack

#   resource_group_name = module.rg.name
#   cidrs               = ["10.10.1.0/16"]
# }

# module "subnet" {
#   source  = "claranet/subnet/azurerm"
#   version = "x.x.x"

#   environment    = var.environment
#   location_short = module.azure_region.location_short
#   client_name    = var.client_name
#   stack          = var.stack

#   resource_group_name = module.rg.name

#   virtual_network_name = module.vnet.name
#   cidrs                = ["10.10.1.0/24"]

#   route_table_name = module.route_table.name
# }
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2.28 |
| azurerm | ~> 4.31 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_route.force_internet_tunneling](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route) | resource |
| [azurerm_route_table.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table) | resource |
| [azurecaf_name.rt](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bgp\_route\_propagation\_enabled | Option to enable BGP route propagation on this Route Table. | `bool` | `false` | no |
| client\_name | Client name/account used in naming. | `string` | n/a | yes |
| custom\_name | Custom Route table name, generated if not set. | `string` | `""` | no |
| default\_tags\_enabled | Option to enable or disable default tags. | `bool` | `true` | no |
| environment | Project environment. | `string` | n/a | yes |
| extra\_tags | Additional tags to associate with your resources. | `map(string)` | `{}` | no |
| force\_tunneling\_enabled | Option to enable a route to Force Tunneling (force 0.0.0.0/0 traffic through the Gateway next hop). | `bool` | `false` | no |
| location | Azure location. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `""` | no |
| resource\_group\_name | Resource group name. | `string` | n/a | yes |
| stack | Project stack name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| force\_internet\_tunneling\_route | Route object for Force Internet Tunneling. |
| id | Route table ID. |
| name | Route table name. |
| resource | Route table resource object. |
<!-- END_TF_DOCS -->
## Related documentation

- Terraform documentation: [terraform.io/docs/providers/azurerm/r/route_table.html](https://www.terraform.io/docs/providers/azurerm/r/route_table.html)
- Azure documentation: [docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-forced-tunneling-rm](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-forced-tunneling-rm)
