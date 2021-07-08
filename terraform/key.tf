resource "aws_key_pair" "jkey" {
  key_name   = "jkey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  lifecycle {
    ignore_changes = [tags]
  }
}
