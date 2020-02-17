# api-docs

This repository hosts CanvasCBL's API Docs.

Check them out at [https://go.canvascbl.com/docs](https://go.canvascbl.com/docs)!

## Contributing

There are instructions for running locally [here](#local-testing).

Edit the [`source/index.html.md`](source/index.html.md) file for most things,
but some files are in [`source/includes`](source/includes).

Thank you for helping make CanvasCBL's API docs as great as possible!

## Local Testing

By far, the easiest way to get started is by running the docs server in Docker.

### Docker

Install [Docker Desktop](https://www.docker.com/products/docker-desktop), then
follow the steps below. If you're on a mac with Homebrew, just use
`brew cask install docker`.


2. Run `make build/docker`
3. Run `make run/docker`.
   1. Your container is dynamically attached to the source folder.
You can change anything in there, and it will be updated in your docs.
3. Visit `http://localhost:4567` to see your docs.
4. Use Ctrl+C at any time to stop the server.

### Locally, with ruby

1. Clone this repo `git clone https://github.com/canvascbl/api-docs.git`
2. Install Ruby 2.6
3. `gem install bundler`
4. `make install`
5. `make start`
6. Visit `http://localhost:4567`