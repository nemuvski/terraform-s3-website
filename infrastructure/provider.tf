provider "aws" {
  region = "ap-northeast-1"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    # localstack コンテナに向ける
    s3 = "http://localhost:4566"
  }
}
