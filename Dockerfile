FROM ruby:2.6.3
RUN apt-get update
RUN apt-get install -y \
  imagemagick \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client \
  yarn
WORKDIR /actioncable
COPY Gemfile Gemfile.lock /actioncable/
RUN bundle install