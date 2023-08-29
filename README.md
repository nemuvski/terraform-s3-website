# terraform-s3-website

## ディレクトリ

- `www/`
  - バケットに配置する HTML ファイル等を格納
- `infrastructure/`
  - インフラの定義ファイルを格納

## 必要なソフトウェア等

- `Docker`
- `LocalStack`
- `aws-cli`
- `Terraform`

## 準備

```bash
make ls-start

cd infrastructure
terraform init
terraform apply

cd ..
make sync-s3
```

## チェック

### バケット

```bash
aws s3 ls --endpoint=http://localhost:4566

aws s3 ls --recursive s3://example-www-bucket --summarize --endpoint=http://localhost:4566
```

### terraform output

```bash
cd infrastructure
terraform output
```

### アップロードしたファイル

ブラウザで確認

```bash
open http://example-www-bucket.s3.localhost.localstack.cloud:4566/index.html
```
