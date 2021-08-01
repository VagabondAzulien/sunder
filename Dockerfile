FROM ruby:3.0-alpine

RUN bundle config --global frozen 1
RUN apk add ffmpeg youtube-dl

WORKDIR /app

COPY . .
RUN bundle install
RUN bundle exec rake install:local

USER 1000:1000

WORKDIR /sunder

ENTRYPOINT ["sunder"]
CMD ["help"]
