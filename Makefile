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

clear:
	@rm -rf sea-dist-modules
