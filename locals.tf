locals {
  tags = {
    ManagedBy = "Terrraform"
  }

  container_count = length(var.environment)
}
