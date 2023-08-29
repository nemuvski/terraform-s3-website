output "arn" {
  value = aws_s3_bucket.example_www_bucket.arn
}

output "name" {
  value = aws_s3_bucket.example_www_bucket.id
}

output "domain" {
  value = aws_s3_bucket_website_configuration.example_www_bucket.website_domain
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.example_www_bucket.website_endpoint
}
