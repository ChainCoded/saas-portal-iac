data "aws_ami" "amazon_linux" {
  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_iam_role" "ec2_role" {
  name = "${var.name_prefix}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "${var.name_prefix}-ec2-role"
  }
}

resource "aws_iam_role_policy_attachment" "ssm_core" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "codedeploy_ec2" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforAWSCodeDeploy"
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.name_prefix}-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_instance" "app" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name
  associate_public_ip_address = true

user_data = <<-EOF
            #!/bin/bash
            set -eux

            dnf update -y
            dnf install -y ruby wget httpd

            sed -i 's/^Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
            sed -i 's/<VirtualHost \\*:80>/<VirtualHost *:8080>/' /etc/httpd/conf/httpd.conf || true

            systemctl enable httpd
            systemctl start httpd

            cat > /var/www/html/index.html <<HTMLEOF
            <!DOCTYPE html>
            <html lang="en">
            <head>
              <meta charset="UTF-8">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <title>SaaS Portal</title>
            </head>
            <body>
              <h1>SaaS Portal</h1>
              <p>Initial EC2 bootstrap page. CI/CD deployment will replace this.</p>
            </body>
            </html>
            HTMLEOF

            cat > /var/www/html/health.html <<HTMLEOF
            OK
            HTMLEOF

            cd /tmp
            wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
            chmod +x ./install
            ./install auto

            systemctl enable codedeploy-agent
            systemctl start codedeploy-agent

            systemctl restart httpd
            EOF

  tags = {
    Name = "${var.name_prefix}-app"
    Tier = "application"
  }
}