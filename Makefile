#
# algo
#

.PHONY: clean
clean:  ## Clean test cache
	go clean -testcache
	rm -f coverage.out

.PHONY: cover
cover: test  ## Run unit tests and open the coverage report
	go tool cover -html=coverage.out

.PHONY: lint
lint:  ## Lint source files
	golint -set_exit_status ./...

.PHONY: test
test:  ## Run unit tests
	go test -short -race -coverprofile=coverage.out -covermode=atomic ./...

.PHONY: test-verbose
test-verbose:  ## Run test verbosely
	go test -v ./...

.PHONY: help
help:  ## Print usage information
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-16s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

.DEFAULT_GOAL := help
