.PHONY: ls-start ls-stop ls-ssh
ls-start:
	localstack start -d
ls-stop:
	localstack stop
ls-ssh:
	localstack ssh

.PHONY: sync-s3
sync-s3:
	aws s3 sync ./www/ s3://example-www-bucket/ --endpoint=http://localhost:4566
