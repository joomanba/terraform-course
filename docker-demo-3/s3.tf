resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-e20210118"
  acl    = "private"

  tags = {
    Name = "Terraform state"
  }
}
