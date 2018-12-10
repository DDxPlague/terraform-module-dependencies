module "alb_module" {
  source = "./module-1"
}

module "some_other_module" {
  source = "./module-2"

  # This enforces the dependency between modules until inter-module
  # dependency is native to the terraform core
  alb_module_is_ready = "${module.alb_module.is_complete}"
}
