data "azurerm_subscription" "current" {}

resource "azurerm_role_definition" "azure_role" {
  name          =   "operador de vm"
  scope         =   "${data.azurerm_subscription.current.id}"
  description   =   "This is a custom role created via Terraform"

  permissions {
    actions       =   ["Microsoft.Compute/*/read",
    "Microsoft.Compute/virtualMachines/restart/action"]
    not_actions   =   []
  }

  assignable_scopes   =   [
    "${data.azurerm_subscription.current.id}", # /subscriptions/00000000-0000-0000-0000-000000000000
  ]
}