FROM ruby:2.6-alpine
COPY . /docs
RUN apk add build-base nodejs
WORKDIR /docs
RUN gem install bundler && make install
EXPOSE 4567
ENTRYPOINT ["make", "start"]
