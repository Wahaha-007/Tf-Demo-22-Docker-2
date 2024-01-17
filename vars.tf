variable "AWS_REGION" {
  default = "ap-southeast-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "ECS_INSTANCE_TYPE" {
  default = "t2.micro"
}

data "aws_ami" "Linux_ECS" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-2.0.20231219-x86_64-ebs"]
  }
}

variable "ECS_AMIS" {
  type = map(string)
  default = {
    us-east-1      = "ami-0b0ea68c435eb488d" #"ami-13be557e"
    us-west-2      = "ami-0688ba7eeeeefe3cd" #"ami-06b94666"
    ap-southeast-1 = "ami-0f74c08b8b5effa56" #eu-west-1 = "ami-0d729a60"
  }
}

# Full List: http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
# For ECS Optimized name https://github.com/aws/amazon-ecs-ami/releases

# Before apply this Terraform, we need to Appply Tf-Demo-19 to create and put data in ECR,
# Then copy terraform.tfsate to this directory so that ECR will not be re-create
