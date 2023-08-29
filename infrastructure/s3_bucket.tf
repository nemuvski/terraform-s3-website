resource "aws_s3_bucket" "example_www_bucket" {
  bucket = "example-www-bucket"
}

resource "aws_s3_bucket_acl" "example_www_bucket" {
  bucket = aws_s3_bucket.example_www_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "example_www_bucket" {
  bucket = aws_s3_bucket.example_www_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }
}

resource "aws_s3_object" "example_www_html_object" {
  depends_on   = [aws_s3_bucket.example_www_bucket]
  bucket       = aws_s3_bucket.example_www_bucket.id
  for_each     = fileset("${path.root}", "www/*.html")
  key          = basename(each.value)
  source       = each.value
  etag         = filemd5("${each.value}")
  content_type = "text/html"
  acl          = "public-read"
}

resource "aws_s3_bucket_policy" "example_www_bucket" {
  bucket = aws_s3_bucket.example_www_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.example_www_bucket.arn,
          "${aws_s3_bucket.example_www_bucket.arn}/*"
        ]
      }
    ]
  })
}
