# terraform-alb-private-ec2
LB Security Group

Inbound: HTTP (80) from 0.0.0.0/0

Outbound: All traffic

EC2 Security Group

Inbound: HTTP (80) only from ALB Security Group

Outbound: All traffic (via NAT Gateway)

This ensures:

EC2 is not publicly accessible

Only ALB can reach the EC2 instance

⚙️ Terraform Structure
.
├── main.tf            # Core infrastructure resources
├── variables.tf       # Input variables
├── outputs.tf         # Useful outputs (ALB DNS, EC2 ID, etc.)
├── provider.tf        # AWS provider configuration
├── vpc.tf             # VPC, subnets, routing
├── alb.tf             # ALB, target group, listener
├── ec2.tf             # EC2 instance + user_data (Nginx)
├── security.tf        # Security groups
└── README.md          # Documentation
🚀 Deployment Instructions
1️⃣ Prerequisites

AWS Account

IAM user with sufficient permissions

Terraform >= 1.3

AWS CLI configured

aws configure
2️⃣ Initialize Terraform
terraform init
3️⃣ Review the Execution Plan
terraform plan
4️⃣ Apply the Infrastructure
terraform apply

Type yes when prompted.

🌐 Accessing the Application

Once Terraform finishes, it will output:

ALB DNS Name

Example:

http://my-alb-123456.us-east-1.elb.amazonaws.com

Opening this URL will display the Nginx welcome page, served from the EC2 instance in the private subnet.

📤 Outbound Internet Access

The EC2 instance:

❌ Has no public IP

✅ Can access the internet for:

OS updates

Package installation

External APIs

This is enabled through the NAT Gateway in the public subnet.

💰 Cost Considerations

Main cost drivers:

NAT Gateway (hourly + data processed)

Application Load Balancer

EC2 instance

⚠️ Remember to destroy resources when finished:

terraform destroy
🧩 Improvements & Extensions

Possible enhancements:

Auto Scaling Group instead of single EC2

HTTPS using ACM

CloudWatch logs and alarms

Remote Terraform backend (S3 + DynamoDB)

📸 Architecture Diagram

Include the architecture diagram in the repo:

/diagram/aws-architecture.png
🧑‍💻 Author

Your Name
Cloud / DevOps Engineer

📄 License

This project is licensed under the MIT License.