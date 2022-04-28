data "aws_ami" "amazon-linux" {
  owners = ["amazon"]
  # owners = ["*"]
  most_recent = true
  filter {
    name = "name"

    values = [
      # "amzn2-ami-hvn-2.0*-x86_64-gp2"
      "Windows*"
    ]
  }
}

data "http" "myip" {
  url = "https://api.ipify.org/"

  request_headers = {
    Accept = "application/text"
  }
}
