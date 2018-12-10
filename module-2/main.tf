resource "null_resource" "is_ready" {
  triggers {
    is_ready = "${var.alb_module_is_ready}"
  }
}
