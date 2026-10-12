resource "aws_instance" "bastion" {
  ami           = data.aws_ami.roboshop.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id = local.public_subnet_id
  iam_instance_profile = aws_iam_instance_profile.bastion.name
   user_data = templatefile("${path.module}/bastion.sh.tftpl", {
    partition_number = 4
    extend_size = 30
  })

root_block_device {
    volume_size           = 50       # Size in GB
    volume_type           = "gp3"    # General Purpose SSD (gp3)
   # encrypted             = true     # Enables EBS encryption
    #delete_on_termination = true     # Deletes volume when instance is destroyed  ----> this one also we can disable, as it automatically deletes the volume afer termination of the EC2 instance


    tags = merge(
        {
        Name = "${local.common_name}-bastion"
        },
        local.common_tags
    )
  }



  tags = merge(
    {
    Name = "${local.common_name}-bastion"
    },
    local.common_tags
  )
  }
