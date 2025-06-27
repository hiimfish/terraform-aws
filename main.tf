data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["099720109477"]

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    filter {
        name   = "name"
        values = ["ubuntu/images/*ubuntu-noble-24.04-amd64-server-*"]
    }
}

resource "aws_instance" "hello_world" {
  ami           = data.aws_ami.ubuntu.id
  subnet_id     = var.subnet_id
  instance_type = var.instance_type
}