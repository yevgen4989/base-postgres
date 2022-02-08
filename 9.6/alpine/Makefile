-include env_make

# 10.2 => 10, 9.6.3 => 9.6
# http://www.databasesoup.com/2016/05/changing-postgresql-version-numbering.html
POSTGRES_MAJOR_VER ?= $(shell echo "$(POSTGRES_VER)" | sed -E 's/.[0-9]+$$//')

TAG ?= $(POSTGRES_MAJOR_VER)
ALPINE_VER ?= 3.15

PLATFORM ?= linux/amd64

REPO = yevgen4989/base-postgres
NAME = base-postgres-$(POSTGRES_VER)

ifeq ($(BASE_IMAGE_STABILITY_TAG),)
    BASE_IMAGE_TAG := $(ALPINE_VER)
else
    BASE_IMAGE_TAG := $(ALPINE_VER)-$(BASE_IMAGE_STABILITY_TAG)
endif

.PHONY: build buildx-build buildx-push test push shell run start stop logs clean release

default: build

build:
	docker build -t $(REPO):$(TAG) \
		-f Dockerfile.template \
		--build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) ./

buildx-build:
	docker buildx build -t $(REPO):$(TAG) \
	    --platform $(PLATFORM) \
		-f Dockerfile.template \
		--build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) ./

buildx-push:
	docker buildx build \
    	--build-arg BASE_IMAGE_TAG=$(BASE_IMAGE_TAG) \
	    --platform $(PLATFORM) \
		-f Dockerfile.template \
		--push -t $(REPO):$(TAG) ./

test:
	IMAGE=$(REPO):$(TAG) ./test.sh

push:
	docker push $(REPO):$(TAG)

shell:
	docker run --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) /bin/bash

run:
	docker run --rm --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG) $(CMD)

start:
	docker run -d --name $(NAME) $(PORTS) $(VOLUMES) $(ENV) $(REPO):$(TAG)

stop:
	docker stop $(NAME)

logs:
	docker logs $(NAME)

clean:
	-docker rm -f $(NAME)

release: build push
