provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "5bd0f89724a69940951c4ccce1acc76572b89a9f"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-18 12:47:46"
    git_last_modified_by = "54596211+vineet-persad@users.noreply.github.com"
    git_modifiers        = "54596211+vineet-persad"
    git_org              = "vineet-persad"
    git_repo             = "terragoat"
    yor_trace            = "a5300675-3ddd-4743-b001-92fb989cf882"
    yor_name             = "ssh_traffic"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "5bd0f89724a69940951c4ccce1acc76572b89a9f"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-18 12:47:46"
    git_last_modified_by = "54596211+vineet-persad@users.noreply.github.com"
    git_modifiers        = "54596211+vineet-persad"
    git_org              = "vineet-persad"
    git_repo             = "terragoat"
    yor_trace            = "b26aac10-e297-4f1e-9429-8f4f2c2c5806"
    yor_name             = "web_server_instance"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
