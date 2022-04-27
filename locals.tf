locals {
  tags = {
    ManagedBy = "Terrraform"
  }

  container_count = length(var.environment)

  buckets = {
    curso-terrraform-ninja-2022-01 = {
      acl = "private"
    }
    curso-terrraform-ninja-2022-02 = {
      acl = "public-read"
    }
  }

  instance_number = lookup(var.instance_number, var.environment2)
}
