
install:
	@npm install
	@spm install

build: clear
	@./bin/spm-build-deps

clear:
	@rm -rf sea-dist-modules
