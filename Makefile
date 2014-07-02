version = $(shell cat package.json | grep version | awk -F'"' '{print $$4}')

install:
	@npm install
	@spm install

build: clear
	@./bin/spm-build-deps

publish:
	@npm publish
	@git tag $(version)
	@git push origin $(version)

clear:
	@rm -rf sea-dist-modules
