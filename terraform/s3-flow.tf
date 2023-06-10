# Crear bucket para flow log
resource "aws_s3_bucket" "this" {
  bucket = "bc-${local.prefix}-vpc-flow-andy"
  tags   = {
    Name        = "${local.prefix}-vpc-flow-andy"
    Environment = local.env
    Path        = "${basename(abspath(path.module))}/s3-flow.tf"
  }
}