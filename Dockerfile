FROM ruby:2.5

# Enable HTTPS apt sources
RUN apt-get update -qq \
  && apt-get install -y apt-transport-https ca-certificates

# Add apt sources for nodejs and yarn
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install the dependencies
RUN apt-get update -qq \
  && apt-get install -y build-essential libpq-dev nodejs yarn

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install

COPY . /app
