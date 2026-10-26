# Migration Project:

DevOps team is strategizing the migration of a portion of their infrastructure to the AWS cloud. Recognizing the scale of this undertaking, We have opted to approach the migration in incremental steps rather than as a single massive transition. To achieve this, we have segmented large tasks into smaller, more manageable units. This granular approach enables the team to execute the migration in gradual phases, ensuring smoother implementation and minimizing disruption to ongoing operations. By breaking down the migration into smaller tasks, DevOps team can systematically progress through each stage, allowing for better control, risk mitigation, and optimization of resources throughout the migration process.

## TASK 1

For this task, create a key pair using Terraform with the following requirements:

Name of the key pair should be ""medicare-retirement-kp.

Key pair type must be "rsa".

The private key file should be saved under ** ./medicare-retirement-kp.pem.
The Terraform working directory is ** /home/bob/terraform ** . Create the main.tf file (do not create a different keyPair.tf file) to accomplish this task.

## TASK 2
Use Terraform to create a security group under the medicare_retirement_solution VPC with the following requirements:

1) The name of the security group must be medicare-retirement-sg.

2) The description must be Security group for medicare-retirement App Servers.

3) Add an inbound rule of type HTTP, with a port range of 80, and source CIDR range 0.0.0.0/0.

4) Add another inbound rule of type SSH, with a port range of 22, and source CIDR range 0.0.0.0/0.

Ensure that the security group is created in the us-east-1 region using Terraform. Create netwrok.tf file (do not create a different .tf file) to accomplish this task.

## Task 3
- Create a VPC named **`medicare-retirement-vpc`**
- Deploy in region **`us-east-1`**
- Use any IPv4 CIDR block
- Create the **`network.tf`** file

## Task 4

- Create a VPC named **`medicare-retirement-vpc`**
- Deploy in region **`us-east-1`**
- Use specific IPv4 CIDR block **`192.168.0.0/24`**
- Create the **`network.tf`** file

## Task 5

- Create a VPC named **`medicare-retirement-vpc`**
- Deploy in region **`us-east-1`**
- Use Amazon-provided IPv6 CIDR block

## Task 6

- Allocate an Elastic IP address named **`medicare-retirement-eip`**

👉 **Your task:** Create an Elastic IP address that can be used for static IP assignments to AWS resources during the infrastructure migration.

💡 **Note:** Elastic IP addresses provide static IPv4 addresses that can be associated with EC2 instances, NAT gateways, and other AWS resources.

## Task 7
- The name of the instance must be **`medicare-retirement-ec2`**
- Use the Amazon Linux AMI **`ami-0c101f26f147fa7fd`**
- The instance type must be **`t2.micro`**
- Create a new RSA key named **`medicare-retirement-kp`**
- Attach the default (available by default) security group

👉 **Your task:** Deploy a complete EC2 instance with key pair authentication and proper security configuration for the Medicare Retirement infrastructure migration.

💡 **Note:** This EC2 instance will serve as a foundational compute resource for hosting applications during the migration process.

## Task 8

- Create an AMI from an existing EC2 instance named **`medicare-retirement-ec2`**
- Name of the AMI should be **`medicare-retirement-ec2-ami`**
- Make sure AMI is in **available** state

👉 **Your task:** Create a custom Amazon Machine Image (AMI) from an existing EC2 instance to enable consistent instance deployments with pre-configured settings.

💡 **Note:** AMIs allow you to create reusable snapshots of configured instances for rapid deployment and scaling.
