version = $(shell cat package.json | grep '"version"' | awk -F'"' '{print $$4}')
source = "sea-modules"
destination = "cmd-modules"

publish:
	@npm publish
	@git tag $(version)
	@git push origin $(version)

install:
	@npm install
	@spm install

build:
	@./bin/spm-build-deps

build-s:
	@./bin/spm-build-deps -s $(source)

build-d:
	@./bin/spm-build-deps -d $(destination)

build-f:
	@./bin/spm-build-deps -f

build-v:
	@./bin/spm-build-deps -v

build-all: clear build build-s build-d build-f build-v

clear:
	@rm -rf $(destination) dist/
