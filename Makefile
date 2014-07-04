version = $(shell cat package.json | grep '"version"' | awk -F'"' '{print $$4}')

publish:
	@npm publish
	@git tag $(version)
	@git push origin $(version)

install:
	@npm install
	@spm install

build:
	@./bin/spm-build-deps

build-f:
	@./bin/spm-build-deps -f

build-s:
	@./bin/spm-build-deps -s sea-modules

build-d:
	@./bin/spm-build-deps -d cmd-modules

build-all: build build-f build-s build-d

clear:
	@rm -rf sea-dist-modules
