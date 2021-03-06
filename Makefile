## env_make.template needs to be copied and changed for your enviornment
include env_make

## Your docker namespace
NS = levonk
VERSION ?= latest

## Your docker repo name
REPO = maven
## Name of the image
NAME = maven
INSTANCE = default

.PHONY: build push shell run start stop rm release

build:
	docker build -t $(NS)/$(REPO):$(VERSION) .

refresh:
	docker pull -a $(NS)/$(REPO)

push:
	docker push $(NS)/$(REPO):$(VERSION)

shell:
	docker run --rm --name $(NAME)-$(INSTANCE) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION) /bin/bash

run:
	docker run --rm --name $(NAME)-$(INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION)

start:
	docker run -d --name $(NAME)-$(INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION)

stop:
	docker stop $(NAME)-$(INSTANCE)

rm:
	docker rm $(NAME)-$(INSTANCE)

deploy: build
	make push -e VERSION=$(VERSION)
	docker images $(NS)/$(REPO)

release: deploy
	make push -e VERSION=latest
	docker images $(NS)/$(REPO)

default: build
