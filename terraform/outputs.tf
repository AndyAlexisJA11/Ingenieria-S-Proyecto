output "s3_bucket_name" {
  value = aws_s3_bucket.this.bucket
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "flow_log_id" {
  value = aws_flow_log.this.id
}

output "load_balancer_external_dns" {
  value = aws_lb.external-alb.dns_name
  description = "DNS name for the external Application Load Balancer"
}

output "load_balancer_internal_dns" {
  value = aws_lb.internal-alb.dns_name
  description = "DNS name for the internal Application Load Balancer"
}

