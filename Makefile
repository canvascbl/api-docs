install:
	bundle install --path vendor/bundle

build:
	bundle exec middleman build

build/docker:
	docker build -t canvascbl/api-docs .

start:
	bundle exec middleman server

start/docker:
	docker run \
		--mount type=bind,source="`pwd`/source",target=/docs/source \
		-p 4567:4567 \
		-it \
		canvascbl/api-docs