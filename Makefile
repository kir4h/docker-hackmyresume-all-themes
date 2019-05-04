USERNAME=kir4h
IMAGE=hackmyresume-all-themes
VERSION=$(shell cat VERSION)

.PHONY: build
build:
	docker build -t ${USERNAME}/${IMAGE}:${VERSION} .

.PHONE: release	
release: build	
	git tag -a "${VERSION}" -m "version ${VERSION}"
	git push --tags
	



