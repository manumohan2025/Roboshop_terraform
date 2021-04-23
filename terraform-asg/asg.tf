resource "aws_launch_template" "asg" {
  name                      = "$(var.COMPONENT}-${var.ENV}--templete"
  image_id                  =  data.aws_ami.ami.id
  instance_type             = var.INSTANCE_TYPE
}
resource "aws_autoscaling_group" "asg" {
  name                      = "$(var.COMPONENT}-${var.ENV}--asg"
  max_size                  = 1
  min_size                  = 1
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  launch_template {

    id                      = aws_launch_template.asg.id
    version                 = "$Latest"
  }
  vpc_zone_identifier       = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNETS

