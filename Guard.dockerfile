FROM ruby:2.5.1-alpine

WORKDIR /usr/src/app
VOLUME /usr/src/app
EXPOSE 35729

RUN apk add --no-cache musl-dev libc-dev libstdc++ gcc g++ make
RUN gem install guard-livereload -v '~> 2.5'
RUN apk del --purge gcc g++ make
COPY ./Guardfile ./

ENTRYPOINT guard