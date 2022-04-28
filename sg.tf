resource "aws_security_group_rule" "sg-curso-terraform" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = [ "${chomp(data.http.myip.body)}/32"]
  security_group_id = "sg-3ce7dae04398ee735"
}
