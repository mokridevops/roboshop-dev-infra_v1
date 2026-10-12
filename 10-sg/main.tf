module "sg" {
    count = length(var.sg_names)
    source = "git::https://github.com/mokridevops/terraform-sg.git?ref=main"
    project = var.project
    environment = var.environment
    vpc_id = local.vpc_id
    //sg_name = var.sg_names[count.index]
    sg_name = replace(var.sg_names[count.index],"_","-")

    // replace(string, substring, replacement)

}