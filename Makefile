build:
	docker build --build-arg TARGET="linux-armv7" -t prebuild/linux-armv7 .

push:
	docker push prebuild/linux-armv7
