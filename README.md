## Purpose : To Setup ECS group & Run Task (Local Build)

1. First, we need to find the ECR Optimized ami (Docker and ECR Agent pre-installed)

   Full List: http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html

   For ECS Optimized name https://github.com/aws/amazon-ecs-ami/releases

2. Before apply this Terraform, we need to Appply Tf-Demo-19 to create and put data in ECR,

   Then copy terraform.tfsate to this directory so that ECR will not be re-create

3. After running this Terrraform, we will have

   3.1 ECR with Image (Pre-create from previous Demo-21)

   3.2 ECR (EC2) with 1 instance fix (Adjustable later)

   3.3 Service and Task definition

   3.4 ELB

This whole system is runnable and will produce website displaying "Hello World" at ELB HTTP endpoint.

4. Command usd after SSH to ECR instance

   $cat /etc/ecs/ecs.config --> To see cluster name that this EC2 join

   $docker ps --> To see running docker image and status

   $curl localhost:3000 --> To test local website function

   $tail /var/log/ecs/ecs- --> Have many log files, display only the most recent log file name

   $tail /var/log/ecs/ecsagent.log.2016-10-26-16 --> Display lof file details
