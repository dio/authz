BIN := build/bin/authz
REG ?= dio123
TAG ?= v1

ENVS := CGO_ENABLED=0 GOOS=linux
FLAGS := -a --ldflags '-extldflags "static"' -tags "netgo" -installsuffix netgo

$(BIN):
	$(ENVS) go build $(FLAGS) -o $@

clean:
	rm -f $(BIN)

docker-build: $(BIN)
	docker build -t $(REG)/authz:$(TAG) .

docker-run:
	docker run --rm -it -p 3001:3001 $(REG)/authz:$(TAG)

up: docker-build
	docker-compose up -d

down:
	docker-compose down

.PHONY: clean docker-build docker-run up down
