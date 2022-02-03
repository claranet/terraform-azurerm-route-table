locals {
  # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)

  rt_name = coalesce(var.custom_name, azurecaf_name.rt.result)
}
