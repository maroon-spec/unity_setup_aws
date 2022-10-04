
data "databricks_current_user" "me" {}

resource "databricks_group" "admin_group" {
  provider     = databricks.mws
  display_name = var.unity_admin_group
  force        = true
}

resource "databricks_group_member" "admin_group_member" {
  provider  = databricks.mws
  group_id  = databricks_group.admin_group.id
  member_id = data.databricks_current_user.me.id
}


