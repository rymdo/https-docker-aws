locals {
  constants = {
    security = {
      developer = "tf-${var.environment}-developer"
      public    = "tf-${var.environment}-public"
    }
  }
}
