// Store the Security Group ID in SSM Parameter Store

resource "aws_ssm_parameter" "sg_id" {
    count =  length(var.sg_names)
  name        = "/${var.project}/${var.environment}/${var.sg_names[count.index]}_sg_id" //roboshop/dev/backend_alb_sg_id, //roboshop/dev/mongodb_sg_id
  description = "The ID of the primary application security group"
  type        = "String"
  value       = module.sg[count.index].sg_id
  overwrite = true
}