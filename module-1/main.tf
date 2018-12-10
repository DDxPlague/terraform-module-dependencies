resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = true
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.lb_sg.id}"]
  subnets            = ["${aws_subnet.public.*.id}"]

  enable_deletion_protection = true

  tags {
    Environment = "dev"
  }
}

resource "null_resource" "is_complete" {
  # This depends_on statement should include every resource declared in this
  # module to ensure that all of the resources are completely provisioned
  depends_on = ["aws_lb.test"]
}
