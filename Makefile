SHELL = /bin/bash

.PHONY: all deploy

all: deploy

deploy:
	docker build -t backup-to-s3 .
	docker tag backup-to-s3 registry.abigail.parlette.us:443/backup-to-s3
	docker image push registry.abigail.parlette.us:443/backup-to-s3
