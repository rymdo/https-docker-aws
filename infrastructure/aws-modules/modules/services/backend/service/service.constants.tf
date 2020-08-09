locals {
  constants = {
    service = "backend"
    security = {
      developer = "tf-${var.environment}-developer"
      public    = "tf-${var.environment}-public"
    }
  }
}
