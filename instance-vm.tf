resource "aws_key_pair" "key" {
key_name = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "Containero" {
  # pega o data, o tipo do recurso(aws_ami), o nome(ubuntu), e no caso o id da AMI que usaremos.
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.permitir_ssh_http.id]
  subnet_id              = var.tcb_blog_subnet_public_id
  key_name               = aws_key_pair.key.key_name

  tags = local.tags_padrao
}